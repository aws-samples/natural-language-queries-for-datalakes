class dgConfig():
    # # Set to True if you want to enable experimental features in the logic_advanced directories instead of the simplified logic (in the "logic" directory)
    # ENABLE_ADVANCED_MODE = False

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

    # Choose whether to run SQL queries against the Sqlite databases (if True), or just log the queries (if False)
    RUN_SQL = True

    # Choose the AWS region where both embedding and LLM calls will be sent (ensure that you have the embeddings and LLMs listed below enabled in that region via the AWS Bedrock Console screen!)
    AWS_BEDROCK_REGION = "us-west-2"

    # Choose which model will be used to create vectore embeddings for the FAISS metadata database
    VECTOR_EMBEDDING_MODEL = "amazon.titan-embed-text-v1"

    # Choose which Bedrock LLM version to call to decompose user question into entities for vector serarch
    LLM_VERSION_FOR_ENTITY_DECOMPOSITION = "anthropic.claude-3-sonnet-20240229-v1:0"
    # LLM_VERSION = "anthropic.claude-3-5-sonnet-20240620-v1:0"

    # Choose which Bedrock LLM version to call to filter tables after vector search
    LLM_VERSION_FOR_TABLE_FILTER = "anthropic.claude-3-sonnet-20240229-v1:0"

    # Choose which Bedrock LLM version to call to generate SQL
    # LLM_VERSION_FOR_SQL = "anthropic.claude-3-5-sonnet-20240620-v1:0"
    LLM_VERSION_FOR_SQL = "anthropic.claude-3-sonnet-20240229-v1:0"

    # Choose which Bedrock LLM version to call to analyze and summarize the SQL query results
    LLM_VERSION_FOR_RESULT_SUMMARY = "anthropic.claude-3-sonnet-20240229-v1:0"

    def getParametersString(self):
        parameters = ""
        for attr_name in dir(dgConfig):
            if not attr_name.startswith('__') and not attr_name.endswith('_DIR'):
                val = f"{getattr(dgConfig, attr_name)}__"
                if "/" not in val:
                    if val.startswith("anthropic.claude"):
                        val = val.replace("anthropic.claude", "Claude").split("-20")[0].replace("-","")
                    parameters += val
        return parameters
