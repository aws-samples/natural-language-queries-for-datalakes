import os 
import json
import boto3
from langchain_community.document_loaders import TextLoader, DirectoryLoader
from langchain_community.vectorstores import FAISS
from langchain.indexes.vectorstore import VectorStoreIndexWrapper
from utils.bcolors import Bcolors
from logic.config import dgConfig

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
      
    #define a function that infers the channel/database/table and sets the database for querying
    def query_catalog(self, query, message_placeholder=None):
        
        # This new version of query_catalog is implemented only with LLM
        # TODO: replace it with vector search / graph search
        
        print()
        print("******************* STEP 1.a *********************")
        print("*                                                *")
        print("*         Catalog Query | Vector search          *")
        print("*                                                *")
        print("**************************************************")
        print()
        
        relevant_metadata, scores = self.find_relevant_metadata(query)
        formatted_relevant_metadata = self._format_metadata(relevant_metadata)
        
        print("Relevant metadata documents:\n")
        for i, elt in enumerate(relevant_metadata):
            print("Proximity score: ", scores[i])
            print(elt.page_content)
            print()

        display_response = f"""### Step 1.a - Table search
**Table description documents retrieved by the vector search:** \n\n```\n{formatted_relevant_metadata}\n```\n\n"""
        
        if message_placeholder is not None:
            message_placeholder.markdown(display_response + "▌")


        print()
        print("******************* STEP 1.b *********************")
        print("*                                                *")
        print("*         Catalog Query | Join tables search     *")
        print("*                                                *")
        print("**************************************************")
        print()

        return self._recursive_table_selection(
            query,
            display_response=display_response,
            message_placeholder=message_placeholder,
            str_data_catalog=formatted_relevant_metadata,
            tables=[]
        )
