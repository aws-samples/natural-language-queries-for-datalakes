import ast
import os 
import json
import boto3
import pathlib
from langchain_community.vectorstores import FAISS
from langchain_community.document_loaders import TextLoader, DirectoryLoader
from langchain.indexes.vectorstore import VectorStoreIndexWrapper
from utils.bcolors import Bcolors
from logic.config import dgConfig
from utils.graph.nodeCleanser import pruneUnneededGraphLeaves
from utils.graph.bfs import weightedBfsFindPaths

# Directory to save the vector database
VECTOR_DATABASE_DIR = "./database/"
# File name to save the vector database
VECTOR_DATABASE_FILE = "vector_database.faiss"

class CatalogQuery():
    
    def __init__(self, language_model):
        self.language_model = language_model
        self.embeddings = language_model.embeddings
        self.vectorstore_faiss = None

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
        s = s.replace("<additional_required_tables>", "- Additional required tables: ")
        s = s.replace("</additional_required_tables>", "")
        s = s.replace("<need_more_info>", "- Need more info: ")
        s = s.replace("</need_more_info>", "")
        s = s.replace("<explanation>", "\n##### Explanation: \n")
        s = s.replace("</explanation>", "\n")
        s = s.replace("\n---", "")

        return s

    def _recursive_table_selection(self, query, display_response="", message_placeholder=None, str_data_catalog="", tables=[], database="", depth=0):
        MAX_DEPTH = 5
        if depth >= MAX_DEPTH:
            # If we reach the maximum depth, stop the recursion
            channel, database, tables, formatted_metadata, display_text = None, None, None, None, display_response
        else:
            # Max depth not reached, continue the recursion
            if str_data_catalog == "":
                # If we don't have a string data catalog in input, create one by getting the data catalog for each table
                catalog_for_each_table = [self.find_relevant_metadata(f"DATABASE=\"{database}\" TABLE=\"{table}\"", k=1) for table in tables]
                docs_only = [docs for docs, score in catalog_for_each_table]
                formatted_metadata = [self._format_metadata(doc) for doc in docs_only]
                str_data_catalog = "\n\n".join(formatted_metadata)
            
            prompt = f"""\n\nHuman: Given an input question, we want to generate a SQL query to answer this question.
            But before doing that, we want to find the required tables. We have already pre-selected some tables that may be needed.
            Your task is to select, amongst these tables, the ones that are needed to answer the question, and the ones that may be missing.
            If you do not have enough information about the database schema, give the best answer, try to guess which additional tables would be required, and tell that you need more info.
    
            Business data catalog information about the pre-selected table are given in <tabledesc> tags.
            The input question is given in <question> tags.
            
            <tabledesc>{str_data_catalog}</tabledesc>
            <question>{query}</question>
            
            Give your answer in the following format:
            <answer><channel>postgresql</channel><database>database name</database><tables>["table_1", "table_2", and so on...]</tables>
            <additional_required_tables>["required table 1", "required table 2", and so on...]</additional_required_tables>
            <need_more_info>YES or NO</need_more_info>
            <explanation>explanation of your answer</explanation></answer>
                  
            \n\nAssistant:
            """
    
            print("\nPrompt for join tables search:")
            print(Bcolors.OKGREEN + prompt + Bcolors.ENDC)
            
            header = f"### Step 1.b: Join tables search - Iteration {depth}\n"
            
            previous_display = display_response
            def concatenate_texts(s):
                return previous_display + header + s
    
            def callback(completion):
                s = self._format_output(completion)
                if message_placeholder is not None:
                    message_placeholder.markdown(concatenate_texts(s) + "▌")
    
            generated_text = self.language_model.invoke_with_stream_callback(prompt, callback)
    
            display_text = concatenate_texts(self._format_output(generated_text))
        
            answer = generated_text.split("<answer>")[1].split("</answer>")[0]
            if "--NA--" not in answer:
                channel = answer.split("<channel>")[1].split("</channel>")[0]
                database = answer.split("<database>")[1].split("</database>")[0]
                new_tables = json.loads(answer.split("<tables>")[1].split("</tables>")[0])
                additional_required_tables = json.loads(answer.split("<additional_required_tables>")[1].split("</additional_required_tables>")[0])
                need_more_info = answer.split("<need_more_info>")[1].split("</need_more_info>")[0]
                explanation = answer.split("<explanation>")[1].split("</explanation>")[0]
    
                # Check if we have found the answer
                # Conditions: tables found are equal to the tables given in input (recursion has converged), and no ask for more info from the LLM
                if set(tables) == set(new_tables) and need_more_info == "NO":
                    print("Answer found!")
                    print("Channel: ", channel)
                    print("Database: ", database)
                    print("Tables: ", tables)
                    print("Need more info: ", need_more_info)
                    print("Explanation: ", explanation)
                else:
                    # New recursion
                    return self._recursive_table_selection(
                        query,
                        display_response=display_text,
                        message_placeholder=message_placeholder,
                        str_data_catalog="",
                        tables=new_tables + additional_required_tables,
                        database=database,
                        depth=depth + 1
                    )
            else:
                channel, database, tables, formatted_metadata = None, None, None, None
            return {
                'channel': channel,
                'database': database,
                'table': new_tables,
                'document': formatted_metadata,
                'display_response': display_text,
            }
        
    def _split_question_for_table_search(self, query, display_response="", message_placeholder=None):
        prompt = f"""You are a data anlytics expert.
Given an input question, we want to generate a SQL query to answer this question.
But before doing that, we want to find the required tables. We may need to perform some joins, so we need to find all the tables that are needed.
We are going to perform a vector search in the data catalog to find the tables.
Your task is to create an comprehensive list of questions that we will ask to the data catalog.
Each question must be about a table that you think will be needed.
Each question must contain enough context, because our data catalog could contain similar tables in different databases for different contexts.

<question>{query}</question>

Give your answer in the following format:
<answer>
Your first question here
---
Your second question here
---
Your third question here
...
</answer>
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
    
        answer = generated_text.split("<answer>")[1].split("</answer>")[0]
        question_list = answer.split("---")
        # Trim question_list and remove empty questions
        question_list = [question.strip() for question in question_list if question.strip()]
        user_question_entity_database_list = [{"entity": "TBD", "description": question, "database": "TBD"} for question in question_list if question.strip()]
        return user_question_entity_database_list, display_text
    
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

#         display_response = f"""### Step 1.a - Table search
# **Table description documents retrieved by the vector search:** \n\n```\n{formatted_relevant_metadata}\n```\n\n"""
        
#         if message_placeholder is not None:
#             message_placeholder.markdown(display_response + "▌")

    def _vectorsearch_from_questions(self, query, user_question_entity_database_list, display_response="", message_placeholder=None):
        """
        Perform vector search on the list of questions to find the tables.
        """
        result_list = []

        header = f"### Step 1.c: Table search\n\n"
        display = display_response + header

        # Query vector database for each question
        databases = {}
        most_popular_database = None
        most_popular_database_count = 0
        for user_question_entity_database_dict in user_question_entity_database_list:
            database = user_question_entity_database_dict['database']
            question = user_question_entity_database_dict['description']
            # Add database name to the question
            extended_question = f"DATABASE={database}\n Question: {question}"

            if database not in databases:
                databases[database] = 0
            databases[database] += 1
            if databases[database] > most_popular_database_count:
                most_popular_database = database

            result, _ = self.find_relevant_metadata(extended_question, k=3)
            document = result[0].page_content
            result_list.append(document)

            new_display = "For question: " + question + "\\\n"
            new_display += "Found table: **" + self._get_table_name_from_metadata_document(document) + "** \n\n"

            print(new_display)

            display += new_display

            if message_placeholder is not None:
                message_placeholder.markdown(display + "▌")

        result_set = set(result_list)
        print(f"*** result_set = <<<{result_set}>>>")
        return result_set, display, most_popular_database # LATER REPLACE THIS WITH list(databases.keys()) OR BETTER YET ALLOW MULTIPLE DBS TO BE JOINED AND PASS A DB WITH EACH TABLE NAME


    def _find_tables_in_graph(self, datacatalog_documents, display_response="", message_placeholder=None):

        # Get database name
        database = self._get_database_name_from_metadata_document(list(datacatalog_documents)[0])

        # create list of nodes
        required_nodes = [self._get_table_name_from_metadata_document(document) for document in datacatalog_documents]

        shortest_path = required_nodes # This should be removed after adding the graph search code

        # display result
        header = f"### Step 1.d: Graph search\n\n"
        display = display_response + header
        new_display = f"Database: {database}\\\n"
        new_display += f"Shortest path from start node to required nodes (for now this is not implemented. Shortest path is equal to the input): {shortest_path}\n"
        print(new_display)
        display += new_display
        if message_placeholder:
            message_placeholder.markdown(display + "▌")

        ############################
        # PUT GRAPH SEARCH CODE HERE
        #
        # The following variables are already available at this point:
        #
        # database, in the same format as table name from metadata document - Example: "northwind.db"
        # required nodes, in the same format as table name from metadata document - Example: ['Customers', 'Products', 'Suppliers']
        #
        # Graph search code has already been integrated, see below, but we need to fix some issues
        # 1. put last version from Lionel, without the issue of starting node that cannot be in the middle of the graph
        # 2. create the graphs for the 4 available databases in the appropriate format
        #
        ############################


        # def graphLoader(graphLocation):
        #     with open(graphLocation) as f:
        #         data = f.read()

        #     # print("Data type before reconstruction : ", type(data)) 

        #     # reconstructing the data as a dictionary 
        #     dictionaryObject = ast.literal_eval(data)
        #     # print("Data type after reconstruction : ", type(dictionaryObject)) 

        #     return dictionaryObject

        # graph = graphLoader("./example_data/datalake/graphs/northwind.dict")  # TODO removing hardcoded string

        # requiredNodes = {"NORTHWIND.orders", "NORTHWIND.territories", "NORTHWIND.customer_customer_demo"}   # the list from the vector search (best match for each entity)
        # startNode = 'NORTHWIND.customer_customer_demo' # Anything random from the list works
        # pruneUnneededGraphLeaves(graph, list(requiredNodes))   # List of required nodes instead of the hardcoded array

        # print("Graph after pruning:", graph)

        # shortestPath, totalWeight = weightedBfsFindPaths(graph, startNode, requiredNodes) 

        # print("ShortestPath: ", shortestPath)
    
        return shortest_path, display


    #define a function that infers the channel/database/table and sets the database for querying
    def query_catalog(self, query, message_placeholder=None):

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
        user_question_entity_database_list, display_response = self._split_question_for_table_search(query, display_response=display_response, message_placeholder=message_placeholder)

        print("Question list: ")
        print(user_question_entity_database_list)

        print()
        print("******************* STEP 1.c *********************")
        print("*                                                *")
        print("*                  Catalog Query                 *")
        print("*         Vector search to find tables           *")
        print("*                                                *")
        print("**************************************************")
        print()
        
        # Perform vector search on the list of questions to find the tables
        datacatalog_documents, display_response, most_popular_database = self._vectorsearch_from_questions(query, user_question_entity_database_list, display_response=display_response, message_placeholder=message_placeholder)


        print()
        print("******************* STEP 1.d *********************")
        print("*                                                *")
        print("*                  Catalog Query                 *")
        print("*       Perform graph search to find tables      *")
        print("*                                                *")
        print("**************************************************")
        print()
        
        # Perform vector search on the list of questions to find the tables
        result_list, display_response = self._find_tables_in_graph(datacatalog_documents, display_response=display_response, message_placeholder=message_placeholder)

        ##################################
        # Prepare result for the next step
        ##################################
        # Get data catalog document for each table
        catalog_for_each_table = [self.find_relevant_metadata(f"DATABASE=\"{most_popular_database}\" TABLE=\"{table}\"", k=1) for table in result_list]
        catalog_for_each_table = [elt[0].page_content for elt, _ in catalog_for_each_table]
        # Get channel
        channel = self._get_channel_name_from_metadata_document(catalog_for_each_table[0])

        return {
            'channel': channel,
            'database': most_popular_database,
            'table': result_list,
            'document': catalog_for_each_table,
            'display_response': display_response,
        }


        # This version of query_catalog is implemented only with LLM, without graph search (recursive search of tables with LLM)
        
#         print()
#         print("******************* STEP 1.a *********************")
#         print("*                                                *")
#         print("*         Catalog Query | Vector search          *")
#         print("*                                                *")
#         print("**************************************************")
#         print()
        
#         relevant_metadata, scores = self.find_relevant_metadata(query)
#         formatted_relevant_metadata = self._format_metadata(relevant_metadata)
        
#         print("Relevant metadata documents:\n")
#         for i, elt in enumerate(relevant_metadata):
#             print("Proximity score: ", scores[i])
#             print(elt.page_content)
#             print()

#         display_response = f"""### Step 1.a - Table search
# **Table description documents retrieved by the vector search:** \n\n```\n{formatted_relevant_metadata}\n```\n\n"""
        
#         if message_placeholder is not None:
#             message_placeholder.markdown(display_response + "▌")


#         print()
#         print("******************* STEP 1.b *********************")
#         print("*                                                *")
#         print("*         Catalog Query | Join tables search     *")
#         print("*                                                *")
#         print("**************************************************")
#         print()

#         # return self._recursive_table_selection(
#         #     query,
#         #     display_response=display_response,
#         #     message_placeholder=message_placeholder,
#         #     str_data_catalog=formatted_relevant_metadata,
#         #     tables=[]
#         # )

#         print("Output of find_tables_in_graph: ", 
#               self.find_tables_in_graph(query, display_response=display_response, message_placeholder=message_placeholder, str_data_catalog=formatted_relevant_metadata))

#         exit()

        return None
