import os
import json
import re
from langchain_community.vectorstores import FAISS
from langchain_community.document_loaders import TextLoader, DirectoryLoader
from langchain.indexes.vectorstore import VectorStoreIndexWrapper
from utils.bcolors import Bcolors
from config import dgConfig
from collections import Counter
from logic_advanced.graph_search import GraphPathFinder
from utils.logger import Logger
from logic_advanced.metadata import Metadata
import base64
import streamlit.components.v1 as components

# Directory to save the vector database
VECTOR_DATABASE_DIR = "./database/"
# File name to save the vector database
VECTOR_DATABASE_FILE = "vector_database.faiss"

class CatalogQuery():
    
    def __init__(self, language_model):
        self.language_model = language_model
        self.embeddings = language_model.embeddings
        self.vectorstore_faiss = None
        self.graph_path_finder = None
        self.logger = Logger()
        self.metadata = Metadata()

        self.database_description_dict = {}
        self.database_descriptions = ""
        for doc in DirectoryLoader(dgConfig.DATA_CATALOG_DIR+"/databases", glob="**/*.txt", loader_cls=TextLoader).load():
            db = doc.metadata["source"].split("/")[-1].replace(".txt", "")
            self.database_descriptions += f"\n\nDATABASE: {db}\nDESCRIPTION: {doc.page_content}\n"
            self.database_description_dict[db] = doc.page_content



    def _get_vectorstore_full_path(self):
        return os.path.join(VECTOR_DATABASE_DIR,VECTOR_DATABASE_FILE)
        

    def index_catalog(self):
        # Load the documents
        loader = DirectoryLoader(dgConfig.DATA_CATALOG_DIR+"/tables", glob="**/*.txt", loader_cls=TextLoader)
        docs = loader.load()
        # TODO implement a solution if documents are too large
        # TODO try Titan V2 embeddings
        
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


    # Performs the vector search in the data catalog
    # k is the number of documents retrieved by default
    # database_filter limits the results to a specific database and take the top k records that match that filter
    # Returns a list of dictionries with these keys: {"SCORE": score_int, "DATABASE": database, "TABLE": table, "DOCUMENT": doc.page_content, "QUESTON": question})
    def find_relevant_metadata_with_db_filter(self, question, k=1, database_filter=None):
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
        
        results = vs.similarity_search_with_score(question, k=50)
        result_list = []
        for doc, score in results:
            # print(f"* [SCORE={score}] [{doc.metadata}]:")\
            # print(doc.page_content)
            # print("*************************************\n")
            score_int = int(score)
            db_table = doc.metadata["source"].split("/")[-1].replace(".txt", "")
            database, table = db_table.split("_")
            # print(f"{question}|{score_int}|{database}|{table}")
            print(f"{score_int}|{database}|{table}")
            if database_filter is not None and database_filter != database:
                print(f"SKIPPING BECAUSE DATABASE {database} != FILTER {database_filter}")
                continue
            result_list.append({"SCORE": score_int, "DATABASE": database, "TABLE": table, "DOCUMENT": doc.page_content, "QUESTON": question})

        top_k_list = result_list[:k]
        return top_k_list, ["DELETE ME"]


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
        text = text.strip()
        return text

    def _split_question_for_table_search(self, query, display_response="", message_placeholder=None):

        system_prompt = "You are a data anlytics expert."

        prompt = f"""Given an input question, we want to generate a SQL query to answer this question.
But before doing that, we want to find the required tables. We may need to perform some joins, so we need to find all the tables that are needed.
We are going to perform a vector search in the data catalog to find the tables.
Your task is to create a comprehensive list of sub-questions that we will ask to the data catalog.
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
Do not write any commentary before or after the <ENTITIES> tag.
"""

        print("\nPrompt for question split:")
        print(Bcolors.OKGREEN + prompt + Bcolors.ENDC)
        
        header = f"### Step 1.b: Split question for table search\n\n"
        
        previous_display = display_response
        def concatenate_texts(s):
            s = s.replace('{', '\n{')
            return previous_display + header + s

        def callback(completion):
            s = self._format_output(completion)
            if message_placeholder is not None:
                message_placeholder.markdown(concatenate_texts(s) + "▌")

        generated_text = self.language_model.invoke_with_stream_callback(dgConfig.LLM_VERSION_FOR_ENTITY_DECOMPOSITION, prompt, callback, system_prompt=system_prompt)

        display_text = concatenate_texts(self._format_output(generated_text))
    
        entities = self._stripTag(generated_text, "ENTITIES")
        entities_dict_list = json.loads(entities)
        return entities_dict_list, display_text


    def _split_question_into_entities_for_table_search(self, query, display_response="", message_placeholder=None):

        system_prompt = "You are an expert data analyst and SQL specialist."

        prompt = f"""Read the list of available databases and their descriptions in the <DATABASES> tag below.
Then read the user question in the <QUESTION> tag below.

<DATABASES>
{self.database_descriptions}
</DATABASES>

<QUESTION>
{query}
</QUESTION>

1. In a <DISAMBIGUATED_QUESTION> tag, write a version of the <QUESTION>, where all ambiguous terms and references/pronouns are replaced with specific, clear terms that make it clear exactly what the user wants.

2. In a <DATABASE> tag, write the name of the one database from the <DATABASES> tag that is best suited to answer the <QUESTION>.

3. Identify entities from the <DISAMBIGUATED_QUESTION> that will map to tables in one or more of the databases (e.g., people, objects, events, time frames, filter values, etc.).

4. Create context-rich descriptions:
   - Combine core elements into coherent, specific descriptions that will match the descriptions of database tables and columns
   - Include domain-specific terms from the original question
   - Add synonyms and variations with and without specific domain terms

5. For any entities that correspond to not one but a set of similar tables in the <DATABASES> tag, write a separate copy of the entity for each of those tables, as well as one for the general concept.
For example, if the question asks about "Pet Food Ingredients", and the database contains tables like "Dog Food Ingredients", "Cat Food Ingredients", and "Horse Feed Ingredients",
you'd write "one entity describing dog food, one for cat food, one for horse feed, and one for pet food in general, each with a unique description.

Write an <ENTITIES> XML tag, containing a JSON list of dictionaries, each containing 3 keys:
- "entity": the entity name.
- "description": its complete and unambiguous description.
- "database": the database name (from the <DATABASES> tag) where it is most likely to be found.
Make sure to include the original wording of the entity name in the description, along with common, non-jargon synonyms for obscure or industry terms.
For example, if the question asks about "Nike kicks", you should write something like "Sports footwear, specifically sneakers (kicks) made by the company Nike".

Do not write any commentary before or after these XML tags.
"""

        print("\nPrompt for question entities:")
        print(Bcolors.OKGREEN + prompt + Bcolors.ENDC)
        
        header = f"### Step 1.b: Split question into entities for table search\n\n"
        
        previous_display = display_response
        def concatenate_texts(s):
            s = s.replace('{', '\n{')
            return previous_display + header + s

        def callback(completion):
            s = self._format_output(completion)
            if message_placeholder is not None:
                message_placeholder.markdown(concatenate_texts(s) + "▌")

        generated_text = self.language_model.invoke_with_stream_callback(dgConfig.LLM_VERSION_FOR_ENTITY_DECOMPOSITION, prompt, callback, system_prompt=system_prompt)

        display_text = concatenate_texts(self._format_output(generated_text)) + "\n\n"

        # display_text.replace('{', '\n{')
    
        disambiguated_question = self._stripTag(generated_text, "DISAMBIGUATED_QUESTION")
        self.logger.log(disambiguated_question, "DG_DISAMBIGUATED_QUESTION")

        primary_database = self._stripTag(generated_text, "DATABASE")
        self.logger.log(primary_database, "DG_PRIMARY_DATABASE")

        entities = self._stripTag(generated_text, "ENTITIES")
        entities_dict_list = json.loads(entities)
        return entities_dict_list, primary_database, disambiguated_question, display_text


    def _filter_tables_with_llm(self, query, table_list, database_filter, display_response="", message_placeholder=None):

        all_table_ddl = self.metadata.get_table_ddl(database_filter, table_list, asXML=True, verbose=False)

        system_prompt = "You are an expert data analyst and SQL specialist."

        prompt = f"""
Read the list of candidate tables to answer the question in the <TABLES> tag below.
Then read the user question in the <QUESTION> tag below.

<TABLES>
{all_table_ddl}
</TABLES>

<QUESTION>
{query}
</QUESTION>

In a <FILTERED_TABLES> tag, write the subset of the table list in the <TABLES> tag that removes tables that are most likely not useful for answering the question in the <QUESTION> tag.
Format this filtered table list as a JSON list of table names, without any commentary or explanation before or after the <FILTERED_TABLES> tag.
"""

        print("\nPrompt for table filtering:")
        print(Bcolors.OKGREEN + prompt + Bcolors.ENDC)
        
        header = f"### Step 1.d: Filter table list\n\n"
        
        previous_display = display_response
        def concatenate_texts(s):
            return previous_display + header + s

        def callback(completion):
            s = self._format_output(completion)
            if message_placeholder is not None:
                message_placeholder.markdown(concatenate_texts(s) + "▌")

        generated_text = self.language_model.invoke_with_stream_callback(dgConfig.LLM_VERSION_FOR_TABLE_FILTER, prompt, callback, system_prompt=system_prompt)

        display_text = concatenate_texts(self._format_output(generated_text))
    
        filtered_tables = self._stripTag(generated_text, "FILTERED_TABLES")
        filtered_table_list = json.loads(filtered_tables)
        print(f"RETURNING FILTERED TABLE LIST {filtered_table_list}")
        return filtered_table_list, display_text


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

            if dgConfig.USE_ADVANCED_VECTOR_SEARCH_INSTEAD_OF_DEFAULT_TOP_3:
                result, _ = self.find_relevant_metadata_with_db_filter(extended_question, k=3, database_filter=database)
            else:
                result, _ = self.find_relevant_metadata(extended_question, k=3)
            new_display = f"**For database: ** {database}, question:** {question}\\\n**Potential tables are:** "

            table_names_list = []
            for r in result:
                if dgConfig.USE_ADVANCED_VECTOR_SEARCH_INSTEAD_OF_DEFAULT_TOP_3:
                    document = r["DOCUMENT"]
                else:
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
        self.graph_path_finder = GraphPathFinder(database)
        # find first viable path between the selected tables
        shortest_path_list, required_tables_new = self.graph_path_finder.findShortestPathList(list(required_tables))
        additions = set(required_tables_new).difference(set(required_tables))

        # display result
        header = f"\n\n#### List of tables expanded using graph search for tables required to complete join path\n\n"
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
        
        llm_detected_database = None
        disambiguated_question = query
        if dgConfig.SEARCH_FOR_ENTITIES_INSTEAD_OF_SUBQUESTIONS:
            # Split the question into linguisitc entities
            entities_dict_list, llm_detected_database, disambiguated_question, display_response = self._split_question_into_entities_for_table_search(query, display_response=display_response, message_placeholder=message_placeholder)
            query = disambiguated_question if disambiguated_question else query
        else:
            # Split the question into multiple questions
            entities_dict_list, display_response = self._split_question_for_table_search(query, display_response=display_response, message_placeholder=message_placeholder)

        print("\nEntity list: ")
        print(entities_dict_list)

        if dgConfig.USE_LLM_INSTEAD_OF_VECTOR_SEARCH_TO_IDENTIFY_DATABASE:
            # # find the most popular database
            # database = self._find_most_popular_database(entities_dict_list)
            # print("\nMost popular database: ")
            database = llm_detected_database
            print("\nLLM-Detected database: ")
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

      
        if dgConfig.USE_LLM_TABLE_FILTER:
            print()
            print("******************* STEP 1.e *********************")
            print("*                                                *")
            print("*                  Filter Tables                 *")
            print("* Call LLM to remove unnecessary tables          *")
            print("*                                                *")
            print("**************************************************")
            print()

            required_tables, display_response = self._filter_tables_with_llm(query, required_tables, database_filter=database, display_response=display_response, message_placeholder=message_placeholder)

            self.logger.log(set(required_tables), "QUERY_CATALOG: filtered tables")


        # if we have an ER diagram graph for this database, then use it to add to the required table list any additional unmentioned tables that are needed to join those tables together
        if dgConfig.USE_GRAPH_SEARCH_TO_FIND_JOIN_PATHS and os.path.isfile(f"{dgConfig.DATA_CATALOG_ADVANCED_DIR}/graphs/{database}.dict"):
            required_tables, display_response = self._add_to_tables_list_from_graph(required_tables, database_name_from_first_metadata, display_response=display_response, message_placeholder=message_placeholder)
            self.logger.log(set(required_tables), "QUERY_CATALOG: tables from vector search plus graph search")
            updated_graph_file = "logs/updated_graph.html"
            self.graph_path_finder.graphToHtml(updated_graph_file)
            with open(updated_graph_file, "r") as f:
                html_string = f.read()
                components.html(html_string, width=500, height=500)


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
            'disambiguated_question': disambiguated_question,
            'table': required_tables,
            'document': catalog_for_each_table,
            'display_response': display_response,
        }
