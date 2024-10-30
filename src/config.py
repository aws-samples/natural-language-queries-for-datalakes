class dgConfig():
    # Set to True if you want to enable experimental features in the logic_advanced directories instead of the simplified logic (in the "logic" directory)
    ENABLE_ADVANCED_MODE = True

    # Set to True if you want to enable auth for the Streamlit frontend
    ENABLE_AUTH = False
    
    # Path to data catalog files 
    DATA_CATALOG_DIR = "./example_data/datalake/metadata"
    
    # Path to Sqlite databases
    SQLITE_DATABASES_DIR = "./example_data/datalake/data"
    
    # Path to system and test logs
    LOG_FILE_DIR = "./logs"

    # Path to accuracy test case files
    TEST_QUESTIONS_DIR = "./tests/test_sets"

# TODO: CHANGE TO NAME AND CONST VALUES

    # Choose whether to use most popular database from the initial quesiton decomposition prompt (if True), or to do a vector search with K=1 throught the table metadata using the original user quesiton to identify the database (if False)
    USE_LLM_INSTEAD_OF_VECTOR_SEARCH_TO_IDENTIFY_DATABASE = True

    # Choose whether to split the quesiton into grammar entities (like "the Chicago Bulls basketball team") (if True), or sub-questions (like "Which basketball team is called The Chicago Bulls?") (if False)
    SEARCH_FOR_ENTITIES_INSTEAD_OF_SUBQUESTIONS = True

    # Choose whether to do an addtional walk over the graph JSON file to find additional tables that did not match the user's question, but are necessary to form join paths between those tables
    USE_GRAPH_SEARCH_TO_FIND_JOIN_PATHS = True

    # Choose whether to use vector search that picks the best 3 tables after filtering for a specific DB (if True) instead of the default which just picks the top 3 matches and filters DBs later (if False)
    USE_ADVANCED_VECTOR_SEARCH_INSTEAD_OF_DEFAULT_TOP_3 = True

    # Choose whether to use an extra LLM prompt to remove tables that came back from the vector search but don't seem to relate to the user question
    USE_LLM_TABLE_FILTER = True

    # Choose whether to run SQL queries against the Sqlite databases (if True), or just log the queries (if False)
    RUN_SQL = True

    # Choose the AWS region where both embedding and LLM calls will be sent (ensure that you have the embeddings and LLMs listed below enabled in that region via the AWS Bedrock Console screen!)
    AWS_BEDROCK_REGION = "us-west-2"

    # Choose which model will be used to create vectore embeddings for the FAISS metadata database
    VECTOR_EMBEDDING_MODEL = "amazon.titan-embed-text-v1"

    # Choose whether to give the SQL generation prompt the right to refuse to generate a query and return "ERROR" instead if it thinks the tables provided are insufficient
    ALLOW_SQL_GENERATION_REFUSAL = False

    # Choose which Bedrock LLM version to call to decompose user question into entities for vector serarch
    LLM_VERSION_FOR_ENTITY_DECOMPOSITION = "anthropic.claude-3-sonnet-20240229-v1:0"
    # LLM_VERSION = "anthropic.claude-3-5-sonnet-20240620-v1:0"

    # Choose which Bedrock LLM version to call to filter tables after vector search
    LLM_VERSION_FOR_TABLE_FILTER = "anthropic.claude-3-sonnet-20240229-v1:0"

    # Choose which Bedrock LLM version to call to generate SQL
    LLM_VERSION_FOR_SQL = "anthropic.claude-3-5-sonnet-20240620-v1:0"

    # Choose which Bedrock LLM version to call to analyze and summarize the SQL query results
    LLM_VERSION_FOR_RESULT_SUMMARY = "anthropic.claude-3-sonnet-20240229-v1:0"


    # converts a snake case string into an acronym by taking the first letter after each underscore and the first letter of the string so "MY_SNAKE_STRING" would turn into "MSS"
    def snake_to_acronym(self, snake_str: str) -> str:
        # Handle empty string case
        if not snake_str:
            return ""       
        # Get first letter of the string
        result = [snake_str[0].upper()]
        # Find all characters that come after underscores
        for i in range(1, len(snake_str)):
            if snake_str[i-1] == '_' and snake_str[i].isalpha():
                result.append(snake_str[i].upper())    
        return ''.join(result)
    

    def getParametersString(self, short=False):
        parameters = []
        for attr_name in dir(dgConfig):
            if not attr_name.startswith('__') and not attr_name.endswith('_DIR') and not attr_name == "getParametersString":
                val = f"{getattr(dgConfig, attr_name)}"
                if "/" not in val:
                    if val.startswith("anthropic.claude"):
                        val = val.replace("anthropic.claude", "Claude").split("-20")[0].replace("-","")
                    if short:
                        short_name = self.snake_to_acronym(attr_name)
                        parameters.append(f"{short_name}_{val}")
                    else:
                        parameters.append(f"{attr_name}_{val}")
        return "__".join(parameters)

print(dgConfig().getParametersString())