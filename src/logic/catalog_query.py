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
#         prompt = f"""You are a data anlytics expert.
# Given an input question, we want to generate a SQL query to answer this question.
# But before doing that, we want to find the required tables. We may need to perform some joins, so we need to find all the tables that are needed.
# We are going to perform a vector search in the data catalog to find the tables.
# Your task is to create an comprehensive list of questions that we will ask to the data catalog.
# Each question must be about a table that you think will be needed.
# Each question must contain enough context, because our data catalog could contain similar tables in different databases for different contexts.

# <question>{query}</question>

# Give your answer in the following format:
# <answer>
# Your first question here
# ---
# Your second question here
# ---
# Your third question here
# ...
# </answer>
#         """

        databases = [
            {"name": "Chinook.db", "description": "Music database describing albums, tracks, artists, playlists and purchases", "tables": ["Album", "Artist", "Customer", "Employee", "Genre", "Invoice", "InvoiceLine", "MediaType", "Playlist", "PlaylistTrack", "Track"]},
            {"name": "financial.db", "description": "Financial daabase describing fixed income underwriting records", "tables": ["AUDBDLNK", "AUDRPT", "BDINF", "BDRGMAP", "BDRLNK", "BDTLRPT", "BKRTBL", "CLRLNK", "CLRNGMBR", "CPTBL", "CTRDTL", "CUSTTBL", "EXCPTBL", "EXCPTRLN", "FLDMST", "RGLTRY", "RLSTBL", "TRDCTRLNK", "TRDCUST", "TRDRLNK", "TRDTBL"]},
            {"name": "northwind.db", "description": "Retail shop database describing retail inventory items, orders, customers and suppliers", "tables": ["Categories", "CustomerCustomerDemo", "CustomerDemographics", "Customers", "EmployeeTerritories", "Employees", "Order Details", "Orders", "Products", "Regions", "Shippers", "Suppliers", "Territories"]},
            {"name": "sportsdb.db", "description": "Sports database describing teams, players, game statistics, and sports betting", "tables": ["addresses", "affiliation_phases", "affiliations", "affiliations_documents", "affiliations_events", "affiliations_media", "american_football_action_participants", "american_football_action_plays", "american_football_defensive_stats", "american_football_down_progress_stats", "american_football_event_states", "american_football_fumbles_stats", "american_football_offensive_stats", "american_football_passing_stats", "american_football_penalties_stats", "american_football_rushing_stats", "american_football_sacks_against_stats", "american_football_scoring_stats", "american_football_special_teams_stats", "baseball_action_contact_details", "baseball_action_pitches", "baseball_action_plays", "baseball_action_substitutions", "baseball_defensive_group", "baseball_defensive_players", "baseball_defensive_stats", "baseball_event_states", "baseball_offensive_stats", "baseball_pitching_stats", "basketball_defensive_stats", "basketball_event_states", "basketball_offensive_stats", "basketball_rebounding_stats", "basketball_team_stats", "bookmakers", "core_person_stats", "core_stats", "db_info", "display_names", "document_classes", "document_contents", "document_fixtures", "document_fixtures_events", "document_package_entry", "document_packages", "documents", "documents_media", "events", "events_documents", "events_media", "events_sub_seasons", "ice_hockey_action_participants", "ice_hockey_action_plays", "ice_hockey_defensive_stats", "ice_hockey_event_states", "ice_hockey_offensive_stats", "ice_hockey_player_stats", "injury_phases", "key_aliases", "key_roots", "latest_revisions", "locations", "media", "media_captions", "media_contents", "media_keywords", "motor_racing_event_states", "motor_racing_qualifying_stats", "motor_racing_race_stats", "outcome_totals", "participants_events", "periods", "person_event_metadata", "person_phases", "persons", "persons_documents", "persons_media", "positions", "publishers", "roles", "seasons", "sites", "soccer_defensive_stats", "soccer_event_states", "soccer_foul_stats", "soccer_offensive_stats", "standing_subgroups", "standings", "stats", "sub_periods", "sub_seasons", "team_american_football_stats", "team_phases", "teams", "teams_documents", "teams_media", "tennis_action_points", "tennis_action_volleys", "tennis_event_states", "tennis_return_stats", "tennis_service_stats", "wagering_moneylines", "wagering_odds_lines", "wagering_runlines", "wagering_straight_spread_lines", "wagering_total_score_lines", "weather_conditions"]}
        ]

        prompt = f"""
System: You are an expert data analyst and SQL specialist.

User: Read the list of available databases and their descriptions in the <DATABASES> tag below.
Then read the user question in the <QUESTION> tag below.

<DATABASES>
{json.dumps(databases)}
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

        generated_text = self.language_model.invoke_with_stream_callback(prompt, callback)

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

    def _vectorsearch_from_questions(self, query, entities_dict_list, database, display_response="", message_placeholder=None):
        """
        Perform vector search on the list of questions to find the tables.
        """
        result_list = []

        header = f"### Step 1.c: Table search\n\n"
        display = display_response + header

        # # Query vector database for each question
        # for question in question_list:
        #     # Add database name to the question
        #     extended_question = f"DATABASE={database}\n Question: {question}"

        ### UPDATED CODE
        # Query vector database for each question
        for entity_dict in entities_dict_list:
            # Add database name to the question
            database = entity_dict['database']
            question = entity_dict['description']
            extended_question = f"DATABASE={database}\n Question: {question}"

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
        return result_set, display


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
        
        # Split the question into multiple questions
        database = self._find_database_from_question(query)
        
        print("\nDatabase found: ", database)

        display_response = f"""### Step 1.a - Table search
**Database found:** \n\n```\n{database}\n```\n\n"""
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
        datacatalog_documents, display_response = self._vectorsearch_from_questions(query, entities_dict_list, database=database, display_response=display_response, message_placeholder=message_placeholder)
      
        # Extract list of tables and database name from previous results
        result_list, display_response = self._get_tables_list(datacatalog_documents, display_response=display_response, message_placeholder=message_placeholder)

        ##################################
        # Prepare result for the next step
        ##################################
        # Get data catalog document for each table
        catalog_for_each_table = [self.find_relevant_metadata(f"DATABASE=\"{database}\" TABLE=\"{table}\"", k=1) for table in result_list]
        catalog_for_each_table = [elt[0].page_content for elt, _ in catalog_for_each_table]
        # Get channel
        channel = self._get_channel_name_from_metadata_document(catalog_for_each_table[0])

        return {
            'channel': channel,
            'database': database,
            'table': result_list,
            'document': catalog_for_each_table,
            'display_response': display_response,
        }

        return None