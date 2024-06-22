import ast
import os 
import re 
import json
import boto3
import pathlib
from langchain_community.vectorstores import FAISS
from langchain_community.document_loaders import TextLoader, DirectoryLoader
from langchain.indexes.vectorstore import VectorStoreIndexWrapper
from utils.bcolors import Bcolors
from logic.config import dgConfig
from collections import deque

# Directory to save the vector database
VECTOR_DATABASE_DIR = "./database/"
# File name to save the vector database
VECTOR_DATABASE_FILE = "vector_database.faiss"

class CatalogQuery():
    
    def __init__(self, language_model):
        self.language_model = language_model
        self.embeddings = language_model.embeddings
        self.vectorstore_faiss = None
        self.database_list = []
        with open('example_data/datalake/data/database_descriptions/databases.json') as database_json:
            self.database_list = json.load(database_json)

    def _get_vectorstore_full_path(self):
        return os.path.join(VECTOR_DATABASE_DIR,VECTOR_DATABASE_FILE)
        
    def index_catalog(self):
        # Load the documents
        loader = DirectoryLoader(dgConfig.DATA_CATALOG_DIR, glob="**/*.txt", loader_cls=TextLoader)
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
       

    def stripTag(self, text, tag):
        text = re.sub(f"\n","<BR>",text)
        text = re.sub(f"^.*<{tag}>","",text)
        text = re.sub(f"<\/{tag}>.*$","",text)
        text = re.sub(f"<BR>","\n",text)
        return text
    
    
    def _split_question_for_table_search(self, query, display_response="", message_placeholder=None):
        prompt = f"""
System: You are an expert data analyst and SQL specialist.

User: Read the list of available databases and their descriptions in the <DATABASES> tag below.
Then read the user question in the <QUESTION> tag below.

<DATABASES>
{json.dumps(self.database_list)}
</DATABASES>

<QUESTION>
{query}
</QUESTION>

Write an <ENTITIES> XML tag, containing a JSON list of dictionaries, each containing 3 keys:
- "entity": the entity name.
- "description": its complete and unambiguous description.
- "database": the database name (from the <DATABASES> tag) where it is most likely to be found.
We are going to use each of theses descriptions to do a vector search against metadata about the above databases, to find a table that matches each of these descriptions, so we can write a SQL query to answer the quesiton.
There should be at least one description for every noun or verb phrase that you see in the question in the <QUESTION> tag, since we expect the databases to be normalized, and store one concept per column.
Make sure that each entity describes a single concept. Break any compound phrases into their atomic entities and write an entity string for each.
Disambiguate and expand the entity descriptions to be as complete, detailed and descriptive as possible.
Make sure to include the original wording of the entity name in the description, along with common, non-jargon synonyms for obsure or industry terms.
For example, if the question asks about "Nike kicks", you should write something like "Sports footwear, specifically sneakers (kicks) made by the company Nike".
Do not write any commentary before or after the <ENTITIES> tag.
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

        generated_text = self.language_model.invoke_with_stream_callback(prompt, callback) #"anthropic.claude-3-haiku-20240307-v1:0"

        display_text = concatenate_texts(self._format_output(generated_text))
    
        ### NEW CODE FOR NEW PROMPT
        entities = self.stripTag(generated_text, "ENTITIES")
        entities_dict_list = json.loads(entities)
        question_list = []
        for entity_dict in entities_dict_list:
            question_list.append(entity_dict["description"])
            
        # answer = generated_text.split("<answer>")[1].split("</answer>")[0]
        
        # question_list = answer.split("---")
        # # Trim question_list and remove empty questions
        # question_list = [question.strip() for question in question_list if question.strip()]
        return question_list, display_text, entities_dict_list
    
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

    def _vectorsearch_from_questions(self, query, entities_dict_list, display_response="", message_placeholder=None):
        """
        Perform vector search on the list of questions to find the tables.
        """
        result_list = []

        header = f"\n### Step 1.c: Table search\n\n"
        display = display_response + header

        databases = {}
        most_popular_database = None
        most_popular_database_count = 0
        # Query vector database for each question
        for entity_dict in entities_dict_list:
            # Add database name to the question
            database = entity_dict['database']
            question = entity_dict['description']
            extended_question = f"DATABASE={database}\n Question: {question}"
            
            if database not in databases:
                databases[database] = 0
            databases[database] += 1
            if databases[database] > most_popular_database_count:
                most_popular_database = database

            result, _ = self.find_relevant_metadata(extended_question, k=1)
            new_display = f"**For database: ** {database}, question:** {question}\\\n**Potential tables are:** "

            table_names_list = []
            for r in result:
                document = r.page_content
                result_list.append(document)
                table_names_list.append(self._get_table_name_from_metadata_document(document))
            
            new_display += ", ".join(table_names_list) + "."

            print(new_display)

            display += new_display + "\n\n"

            if message_placeholder is not None:
                message_placeholder.markdown(display + "▌")

        result_set = set(result_list)
        print(f"*** result_set = <<<{result_set}>>>")
        return result_set, display, most_popular_database # list(databases.keys())


    def _get_tables_list(self, datacatalog_documents, display_response="", message_placeholder=None):

        # Get database name
        database = self._get_database_name_from_metadata_document(list(datacatalog_documents)[0])

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


    #define a function that loads an E-R graph from the corresponding <database>.dict file
    def _load_graph(self, database, message_placeholder=None):
        graph_path = f"example_data/datalake/{database}.graph.dict"
        print(f"\n### ATTEMPTING TO LOAD JSON FROM FILE {graph_path}")
        with open(graph_path) as graph_file:
            graph = json.load(graph_file)
        return graph


    #define a function that removes all unreachable nodes from a graph (tables that can't possibly connect the required tables)
    def _prune_graph(self, graph, required_node_list, message_placeholder=None):
        start_size = len(graph)
        leaves_pruned = 99 # doesn't matter what we set this to. We keep going until we can't prune any leaves.
        while leaves_pruned > 0:
            leaves_pruned = 0
            prune_list = []
            for node_name, edges in graph.items():
                if node_name not in required_node_list and len(edges)<=1:
                    # delete orphan nodes that have no links at all
                    if len(edges) == 0:
                        # print("Found orphan leaf", node_name, edges)
                        prune_list.append(node_name)
                        break
                    # print("Found leaf to prune", node_name, edges)
                    back_link = list(edges.keys())[0]
                    back_linkNode = graph[back_link]
                    del back_linkNode[node_name]
                    leaves_pruned += 1
                    prune_list.append(node_name)
            for node_name in prune_list:
                del graph[node_name]
        
            # print("RESULTING GRAPH AFTER PRUNING PASS:")
            # for node_name, edges in graph.items():
            #     print(node_name, ": ", edges)
        end_size = len(graph)
        print(f"\n*** PRUNED GRAPH DOWN TO ONLY REQUIRED AND NAVIGABLE NODES - FROM {start_size} TO {end_size}. REMAINGING NODES: {list(graph.keys())}")
        return graph


    #define a function that finds all valid join paths in an E-R graph between the required nodes
    def _find_join_paths_in_graph(self, graph, required_nodes, message_placeholder=None):
        valid_paths = []
        shortest_path = None
        shortest_path_length = None
        queue = deque()
        for node in required_nodes:
            queue.append(([node], 0))
        # print(f"FIND_PATHS: INITIALIZED QUEUE TO {queue}")
    
        while queue:
            (path, total_length) = queue.popleft()
            # print(f"  WHILE: PROCESSING PATH: {path}; TOTAL LENGTH: {total_length}; CURRENT VALID PATHS: {valid_paths}; SHORTEST PATH: {shortest_path}; SHORTES LENGTH: {shortest_path_length};")
            print(f"WHILE: PROCESSING PATH: {path};")

            # print(f"    PATH NODE CHECK: CHECKING PATH: {path}; REQUIRED NODES: {required_nodes};")
            path_contains_all_required_nodes = True
            for node in required_nodes:
                # print(f"      PATH NODE CHECK: CHECKING NODE: {node};")
                if node not in path:
                    # print(f"        PATH NODE CHECK: NODE: {node} NOT IN PATH {path}. EXITING")
                    path_contains_all_required_nodes = False
                    break
            
            if path_contains_all_required_nodes:
                print(f"    IF PATH HAS ALL REQUIRED NODES: APPEND PATH AND WEIGHT TO PATHS AND CONTINUE")
                valid_paths.append((path, total_length))
                if not shortest_path_length or total_length < shortest_path_length:
                    # print(f"    NEW SHORTEST PATH FOUND!")
                    shortest_path = path
                    shortest_path_length = total_length
                    # for (valid_path, valid_path_length) in valid_paths: # remove paths that are longer than the shortest path
                    #     if valid_path_length > shortest_path_length:
                    #         valid_paths.remove((valid_path, valid_path_length))
    
            for node in path:
                # print(f"    FOR NODE: {node}")
                for neighbor, length in graph[node].items():
                    # print(f"    FOR NEIGHBOR: {neighbor}; LENGTH: {length}")
                    if neighbor in path:
                        pass
                        # print(f"      IF NEIGHBOR: {neighbor} ALREADY IN PATH: {path}: do nothing")
                    else:
                        # print(f"      IF NEIGHBOR: {neighbor} NOT IN PATH: {path}: APPEND NEIGHBOR TO PATH, ADD WEIGHT; REMOVE REMAINING REQUIRED IF IT'S ONE; ADD TO QUEUE")
                        new_path = path + [neighbor]
                        new_length = total_length + length
                        if shortest_path_length is None or new_length <= shortest_path_length:
                            queue.append((new_path, new_length))
                            # print(f"      NEW QUEUE: {queue}")
                        else:
                            # print(f"      QUEUE NOT APPENDED: PATH ALREADY LONGER THAN THE SHORTEST KNOWN PATH")
                            pass
    
        print(f"\n### VALID PATHS: <<<{valid_paths}>>>\n")
        #aggregate all unique tables from all valid paths
        all_path_nodes = set()
        for path, path_length in valid_paths:
            print(f"PATH: {path}")
            for node in path:
                print(f"NODE: {node}")
                all_path_nodes.add(node)
        all_path_nodes = list(all_path_nodes)

        print(f"\nJOIN PATH SEARH RETURNING VALID PATHS: <<<{valid_paths}>>>\nSHORTEST PATH: <<<{shortest_path}>>>\nAND ALL PATH NODES: <<<{all_path_nodes}>>>\n\n")

        return valid_paths, shortest_path, all_path_nodes

   
    #define a function that infers the channel/database/table and sets the database for querying
    def query_catalog(self, query, message_placeholder=None):

        # print()
        # print("******************* STEP 1.a *********************")
        # print("*                                                *")
        # print("*                  Catalog Query                 *")
        # print("*             Find relevant database             *")
        # print("*                                                *")
        # print("**************************************************")
        # print()
        
        # # Split the question into multiple questions
        # database = self._find_database_from_question(query)
        
        # print("\nDatabase found: ", database)

#         display_response = f"""### Step 1.a - Table search
# **Database found:** \n\n```\n{database}\n```\n\n"""

        display_response = f"""### SKIPPING Step 1.a - **DATABASE SEARCH:\n\n"""
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
        
        # Split the question into multiple questions
        question_list, display_response, entities_dict_list = self._split_question_for_table_search(query, display_response=display_response, message_placeholder=message_placeholder)

        print("Question list: ")
        print(question_list)

        print()
        print("******************* STEP 1.c *********************")
        print("*                                                *")
        print("*                  Catalog Query                 *")
        print("*         Vector search to find tables           *")
        print("*                                                *")
        print("**************************************************")
        print()
        
        # Perform vector search on the list of questions to find the tables
        datacatalog_documents, display_response, most_popular_database = self._vectorsearch_from_questions(query, entities_dict_list, display_response=display_response, message_placeholder=message_placeholder)
      
        # Extract list of tables and database name from previous results
        table_list, display_response = self._get_tables_list(datacatalog_documents, display_response=display_response, message_placeholder=message_placeholder)

        ##################################
        # Prepare result for the next step
        ##################################
        # Get data catalog document for each table
        catalog_for_each_table = [self.find_relevant_metadata(f"DATABASE=\"{most_popular_database}\" TABLE=\"{table}\"", k=1) for table in table_list]
        catalog_for_each_table = [elt[0].page_content for elt, _ in catalog_for_each_table]
        # Get channel
        channel = self._get_channel_name_from_metadata_document(catalog_for_each_table[0])

        print(f"***** GOT:\nchannel: <<<{channel}>>>\nmost_popular_database: <<<{most_popular_database}>>>\ntable: <<<{table_list}>>>\ndocument: <<<{catalog_for_each_table}>>>\nEND\n")

        header = f"\n### Step 1.d: Graph search\n\n"
        display = display_response + header
        message_placeholder.markdown(display + "▌")

        graph = self._load_graph(most_popular_database, message_placeholder=None)

        print(f"\n### LOADED GRAPH FOR DATABASE {most_popular_database}: <<<{graph}>>>\n")
    
        # display = f"\n"
        # message_placeholder.markdown(display + "▌")
        
        pruned_graph = self._prune_graph(graph, table_list, message_placeholder=None)
        
        print(f"\n### PRUNED GRAPH DOWN TO REQUIRED TABLES {table_list} AND POSSIBLE CONNECTORS: <<<{graph}>>>\n")

        valid_paths, shortest_path, all_path_tables = self._find_join_paths_in_graph(pruned_graph, table_list, message_placeholder=None)

        print(f"\n### SEARCHED GRAPH FOR CONNECTORS BETWEEN REQUIRED TABLES {table_list}. SHORTEST PATH: <<<{shortest_path}>>>. ALL POSSIBLE PATH TABLES: <<<{all_path_tables}>>>\n")

        display += f"\n#Found shortest path {shortest_path}\n"
        display += f"\n#Found spanning tree of tables {all_path_tables}\n"
        message_placeholder.markdown(display + "▌")

        print(f"***** RETURNING:\nchannel: <<<{channel}>>>\nmost_popular_database: <<<{most_popular_database}>>>\njoin_path: <<<{shortest_path}>>>\ntable: <<<{all_path_tables}>>>\ndocument: <<<{catalog_for_each_table}>>>\nEND\n")
        
        ## This entire dict gets passed to sql_query.generate_sql()
        return {
            'channel': channel,
            'database': most_popular_database,
            'table': all_path_tables,
            'join_path': shortest_path,
            'document': catalog_for_each_table,
            'display_response': display_response,
        }

        return None