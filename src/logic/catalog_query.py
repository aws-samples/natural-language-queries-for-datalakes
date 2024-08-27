import os
import json
import re
from langchain_community.vectorstores import FAISS
from langchain_community.document_loaders import TextLoader, DirectoryLoader
from langchain.indexes.vectorstore import VectorStoreIndexWrapper
from utils.bcolors import Bcolors
from logic.config import dgConfig
from collections import Counter
from logic.graph_search import GraphPathFinder
from utils.logger import Logger

# Directory to save the vector database
VECTOR_DATABASE_DIR = "./database/"
# File name to save the vector database
VECTOR_DATABASE_FILE = "vector_database.faiss"

class CatalogQuery():
    
    def __init__(self, language_model):
        self.language_model = language_model
        self.embeddings = language_model.embeddings
        self.vectorstore_faiss = None
        self.logger = Logger()

        self.database_descriptions = ""
        for doc in DirectoryLoader(dgConfig.DATA_CATALOG_DIR+"/databases", glob="**/*.txt", loader_cls=TextLoader).load():
            db = doc.metadata["source"].split("/")[-1].replace(".txt", "")
            self.database_descriptions += f"\n\nDATABASE: {db}\nDESCRIPTION: {doc.page_content}\n"



    def _get_vectorstore_full_path(self):
        return os.path.join(VECTOR_DATABASE_DIR,VECTOR_DATABASE_FILE)
        

    def index_catalog(self):
        # Load the documents
        loader = DirectoryLoader(dgConfig.DATA_CATALOG_DIR+"/tables", glob="**/*.txt", loader_cls=TextLoader)
        docs = loader.load()
        # TODO implement a solution if documents are to large
        
        # Generate embeddings for the documents
        vectorstore_faiss = FAISS.from_documents(
            docs,
            self.embeddings,
        )

        wrapper_store_faiss = VectorStoreIndexWrapper(vectorstore=vectorstore_faiss)
        
        # Create directory to save vector database
        if not os.path.exists(os.path.dirname(VECTOR_DATABASE_DIR)):
            os.makedirs(os.path.dirname(VECTOR_DATABASE_DIR))
        
        # Save vector database
        vectorstore_faiss.save_local(self._get_vectorstore_full_path())
        
    # Performs the vector search in the data catalog
    # k is the number of documents retrieved by default
    def find_relevant_metadata(self, question, k=5):
        if self.vectorstore_faiss is None:
            
            if not os.path.exists(self._get_vectorstore_full_path()):
                print("Vector database not found. Please index the catalog first.")
                assert False

            self.vectorstore_faiss = FAISS.load_local(
                                        self._get_vectorstore_full_path(),
                                        self.embeddings,
                                        allow_dangerous_deserialization=True)
            
        vs = self.vectorstore_faiss

        # query_embedding = vs.embedding_function(question)            
        # relevant_metadata = vs.similarity_search_by_vector(query_embedding)
        
        relevant_metadata = vs.similarity_search_with_score(question, k=k)
        docs, scores = zip(*relevant_metadata)
        
        return docs, scores
        
    def _format_metadata(self, metadata):
        docs = []
        # Remove indentation and line feed (commented to get better lisibility in output)
        for elt in metadata:
            processed = elt.page_content
            # for i in range(20, -1, -1):
            #     processed = processed.replace('\n' + ' ' * i, '')
            docs.append(processed)
        result = '\n\n'.join(docs)
        # Escape curly brackets
        result = result.replace('{', '{{')
        result = result.replace('}', '}}')
        return result

    def _format_output(self, s):
        """
        Format output to be displayed in the chat window
        """
        s = s.replace("<answer>", "")
        s = s.replace("</answer>", "")
        s = s.replace("<channel>", "- Channel: ")
        s = s.replace("</channel>", "")
        s = s.replace("<database>", "- Database: ")
        s = s.replace("</database>", "")
        s = s.replace("<tables>", "- Tables: **")
        s = s.replace("</tables>", "**")
        s = s.replace("<explanation>", "\n##### Explanation: \n")
        s = s.replace("</explanation>", "\n")
        s = s.replace("\n---", "")

        return s

    def _stripTag(self, text, tag):
        text = re.sub(f"\n","<BR>",text)
        text = re.sub(f"^.*<{tag}>","",text)
        text = re.sub(f"</{tag}>.*$","",text)
        text = re.sub(f"<BR>","\n",text)
        return text

    def _split_question_for_table_search(self, query, display_response="", message_placeholder=None):

        prompt = f"""You are a data anlytics expert.
Given an input question, we want to generate a SQL query to answer this question.
But before doing that, we want to find the required tables. We may need to perform some joins, so we need to find all the tables that are needed.
We are going to perform a vector search in the data catalog to find the tables.
Your task is to create an comprehensive list of sub-questions that we will ask to the data catalog.
Each sub-question must be about a table that you think will be needed.
Each sub-question must contain enough context, because our data catalog could contain similar tables in different databases for different contexts.

<DATABASES>
{self.database_descriptions}
</DATABASES>

<QUESTION>{query}</QUESTION>

Write an <ENTITIES> XML tag, containing a JSON list of dictionaries, each containing 3 keys:
- "entity": the main theme of the sub-question.
- "description": the sub-question.
- "database": the database name (from the <DATABASES> tag) where data to answer the sub-question is most likely to be found.
"""

        print("\nPrompt for question split:")
        print(Bcolors.OKGREEN + prompt + Bcolors.ENDC)
        
        header = f"### Step 1.b: Split question for table search\n\n"
        
        previous_display = display_response
        def concatenate_texts(s):
            return previous_display + header + s

        def callback(completion):
            s = self._format_output(completion)
            if message_placeholder is not None:
                message_placeholder.markdown(concatenate_texts(s) + "▌")

        generated_text = self.language_model.invoke_with_stream_callback(prompt, callback)

        display_text = concatenate_texts(self._format_output(generated_text))
    
        entities = self._stripTag(generated_text, "ENTITIES")
        entities_dict_list = json.loads(entities)
        return entities_dict_list, display_text


    def _split_question_into_entities_for_table_search(self, query, display_response="", message_placeholder=None):

        prompt = f"""
System: You are an expert data analyst and SQL specialist.

User: Read the list of available databases and their descriptions in the <DATABASES> tag below.
Then read the user question in the <QUESTION> tag below.

<DATABASES>
{self.database_descriptions}
</DATABASES>

<QUESTION>
{query}
</QUESTION>

Follow these steps:
1. Identify core elements of the question:
   - Main entities (e.g., people, objects, events)
   - Actions or relationships
   - Measures or attributes
   - Time frames or scopes
   - Comparisons or rankings
   - Specific domains or sports mentioned

2. Create context-rich descriptions:
   - Combine core elements into coherent, specific descriptions
   - Include domain-specific terms from the original question
   - Create variations with and without specific domain terms

3. Generate broader and narrower descriptions:
   - Create some descriptions that are more general (for normalized schemas)
   - Create some that are very specific (for denormalized or domain-specific tables)

4. Include potential table name hints:
   - Incorporate likely table name fragments based on the question's domain

5. Add related concept descriptions:
   - Think about related information that might be in separate tables
   - Create descriptions for these related concepts

6. Format for vector store querying:
   - Structure each description as a clear, concise phrase
   - Prefix each with the database name and "question:" prompt

7. Review and refine:
   - Ensure the set of descriptions covers general and specific interpretations
   - Check that all key aspects of the original question are represented

Write an <ENTITIES> XML tag, containing a JSON list of dictionaries, each containing 3 keys:
- "entity": the entity name.
- "description": its complete and unambiguous description.
- "database": the database name (from the <DATABASES> tag) where it is most likely to be found.
Make sure to include the original wording of the entity name in the description, along with common, non-jargon synonyms for obsure or industry terms.
For example, if the question asks about "Nike kicks", you should write something like "Sports footwear, specifically sneakers (kicks) made by the company Nike".
Do not write any commentary before or after the <ENTITIES> tag.
        """

        print("\nPrompt for question entities:")
        print(Bcolors.OKGREEN + prompt + Bcolors.ENDC)
        
        header = f"### Step 1.b: Split question into entities for table search\n\n"
        
        previous_display = display_response
        def concatenate_texts(s):
            return previous_display + header + s

        def callback(completion):
            s = self._format_output(completion)
            if message_placeholder is not None:
                message_placeholder.markdown(concatenate_texts(s) + "▌")

        generated_text = self.language_model.invoke_with_stream_callback(prompt, callback)

        display_text = concatenate_texts(self._format_output(generated_text))
    
        entities = self._stripTag(generated_text, "ENTITIES")
        entities_dict_list = json.loads(entities)
        return entities_dict_list, display_text


    def _get_channel_name_from_metadata_document(self, document):
        """
        Get the channel name from the metadata document.
        """
        channel_name = document.split("CHANNEL=\"")[1].split("\"")[0]
        return channel_name


    def _get_database_name_from_metadata_document(self, document):
        """
        Get the database name from the metadata document.
        """
        database_name = document.split("DATABASE=\"")[1].split("\"")[0]
        return database_name    


    def _get_table_name_from_metadata_document(self, document):
        """
        Get the table name from the metadata document.
        """
        table_name = document.split("TABLE=\"")[1].split("\"")[0]
        return table_name    


    def _find_database_from_question(self, query):
        """
        Find the database from the question.
        """
        
        relevant_metadata, scores = self.find_relevant_metadata(query, k=1)

        # Extract database name, knowing that it is in the relevant_metadata string in the following format: <DATABASE=\"{database}\" TABLE=\"{table}\"...
        database = self._get_database_name_from_metadata_document(relevant_metadata[0].page_content)

        return database


    def _find_most_popular_database(self, entities_dict_list):
        """
        Find the most popular database from the entity list.
        """

        # Extract the 'database' values into a list
        databases = [entity['database'] for entity in entities_dict_list]

        # Use Counter to count the occurrences of each value
        database_counts = Counter(databases)

        # Find the most common value
        most_common_database = max(database_counts, key=database_counts.get)

        return most_common_database

    def _vectorsearch_from_questions(self, query, entities_dict_list, database_filter, display_response="", message_placeholder=None):
        """
        Perform vector search on the list of questions to find the tables.
        """
        result_list = []

        header = f"### Step 1.c: Table search\n\n"
        display = display_response + header

        # Query vector database for each question
        for entity_dict in entities_dict_list:
            print(f"LOOKING FOR VECTORS FOR ENTITY {entity_dict}")
            # Add database name to the question
            database = entity_dict['database']
            if database_filter is not None and database != database_filter:
                print(f"IGNORING ENTITY BECAUSE ITS DATABASE IS {database} != {database_filter}")
                continue

            question = entity_dict['description']
            extended_question = f'DATABASE="{database}"\n Question: {question}'

            result, _ = self.find_relevant_metadata(extended_question, k=3)
            new_display = f"**For database: ** {database}, question:** {question}\\\n**Potential tables are:** "

            table_names_list = []
            for r in result:
                document = r.page_content
                if database_filter is not None and f' DATABASE="{database_filter}" ' not in document:
                    print(f"IGNORING DOCUMENT <<<{document[:100]}...>>> BECAUSE ITS DATABASE DOES NOT MATCH {database_filter}")
                    continue
                result_list.append(document)
                table_names_list.append(self._get_table_name_from_metadata_document(document))
            
            new_display += ", ".join(table_names_list) + "."

            print(new_display)

            display += new_display + "\n\n"

            if message_placeholder is not None:
                message_placeholder.markdown(display + "▌")

        result_set = set(result_list)
        return result_set, display


    def _get_tables_list(self, datacatalog_documents, database, display_response="", message_placeholder=None):

        # Get list of tables
        required_tables = [self._get_table_name_from_metadata_document(document) for document in datacatalog_documents]

        # display result
        header = f"#### Database and list of tables found\n\n"
        display = display_response + header
        new_display = f"Database: {database}\\\n"
        new_display += f"List of tables: {required_tables}\n\n"
        print(new_display)
        display += new_display
        if message_placeholder:
            message_placeholder.markdown(display + "▌")

        return required_tables, display


    def _add_to_tables_list_from_graph(self, required_tables, database, display_response="", message_placeholder=None):

        # find first viable path between the selected tables
        required_tables_new = GraphPathFinder(database).findValidPath(list(required_tables))
        additions = required_tables_new.difference(required_tables)

        # display result
        header = f"#### List of tables expanded using graph search for tables required to complete join path\n\n"
        display = display_response + header
        new_display = f"Database: {database}\\\n"
        new_display += f"Added tables: {additions}\n\n"
        new_display += f"New list of tables: {required_tables_new}\n\n"
        print(new_display)
        display += new_display
        if message_placeholder:
            message_placeholder.markdown(display + "▌")

        return required_tables_new, display


    #define a function that infers the channel/database/table and sets the database for querying
    def query_catalog(self, query, message_placeholder=None):

        print()
        print("******************* STEP 1.a *********************")
        print("*                                                *")
        print("*                  Catalog Query                 *")
        print("*             Find relevant database             *")
        print("*                                                *")
        print("**************************************************")
        print()

        display_response = f"""### Step 1.a - Table search\n\n"""        
        if message_placeholder is not None:
            message_placeholder.markdown(display_response + "▌")

        print()
        print("******************* STEP 1.b *********************")
        print("*                                                *")
        print("*                  Catalog Query                 *")
        print("*         Split question for table search        *")
        print("*                                                *")
        print("**************************************************")
        print()
        
        if dgConfig.USE_PROMPT_THAT_SPLITS_QUESTION_INTO_ENTITIES:
            # Split the question into linguisitc entities
            entities_dict_list, display_response = self._split_question_into_entities_for_table_search(query, display_response=display_response, message_placeholder=message_placeholder)
        else:
            # Split the question into multiple questions
            entities_dict_list, display_response = self._split_question_for_table_search(query, display_response=display_response, message_placeholder=message_placeholder)

        print("\nEntity list: ")
        print(entities_dict_list)

        if dgConfig.USE_LLM_INSTEAD_OF_VECTOR_SEARCH_TO_IDENTIFY_DATABASE:
            # find the most popular database
            database = self._find_most_popular_database(entities_dict_list)
            print("\nMost popular database: ")
            print(database)
        else:
            # Split the question into multiple questions
            database = self._find_database_from_question(query)
            print("\nMost vector similar database: ")
            print(database)

        print()
        print("******************* STEP 1.c *********************")
        print("*                                                *")
        print("*                  Catalog Query                 *")
        print("*         Vector search to find tables           *")
        print("*                                                *")
        print("**************************************************")
        print()
        
        # Perform vector search on the list of questions to find the tables
        datacatalog_documents, display_response = self._vectorsearch_from_questions(query, entities_dict_list, database_filter=database, display_response=display_response, message_placeholder=message_placeholder)
      
        print()
        print("******************* STEP 1.d *********************")
        print("*                                                *")
        print("*                  Catalog Query                 *")
        print("* Perform graph search to find additional tables *")
        print("*                                                *")
        print("**************************************************")
        print()
        
        # Get database name from first metadata match
        database_name_from_first_metadata = self._get_database_name_from_metadata_document(list(datacatalog_documents)[0])

        # Perform vector search on the list of questions to find the tables
        required_tables, display_response = self._get_tables_list(datacatalog_documents, database_name_from_first_metadata, display_response=display_response, message_placeholder=message_placeholder)

        self.logger.log(set(required_tables), "QUERY_CATALOG: tables from vector search")

        # if we have an ER diagram graph for this database, then use it to add to the required table list any additional unmentioned tables that are needed to join those tables together
        if dgConfig.USE_GRAPH_SEARCH_TO_FIND_JOIN_PATHS and os.path.isfile(f"{dgConfig.DATA_CATALOG_DIR}/graphs/{database}.dict"):
            required_tables, display_response = self._add_to_tables_list_from_graph(required_tables, database_name_from_first_metadata, display_response=display_response, message_placeholder=message_placeholder)
            self.logger.log(set(required_tables), "QUERY_CATALOG: tables from vector search plus graph search")

        ##################################
        # Prepare result for the next step
        ##################################
        # Get data catalog document for each table
        catalog_for_each_table = [self.find_relevant_metadata(f"DATABASE=\"{database}\" TABLE=\"{table}\"", k=1) for table in required_tables]
        catalog_for_each_table = [elt[0].page_content for elt, _ in catalog_for_each_table]
        # Get channel
        channel = self._get_channel_name_from_metadata_document(catalog_for_each_table[0])

        self.logger.log(entities_dict_list, "QUERY_CATALOG: entities_dict_list")
        self.logger.log(database, "QUERY_CATALOG: Most popular database")
        self.logger.log(datacatalog_documents, "QUERY_CATALOG: vector search results")
        self.logger.log(set(required_tables), "QUERY_CATALOG: tables from graph")

        return {
            'channel': channel,
            'database': database,
            'table': required_tables,
            'document': catalog_for_each_table,
            'display_response': display_response,
        }
