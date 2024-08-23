class dgConfig():
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

    # Choose whether to split the quesiton into grammar entities (like "the Chicago Bulls basketball team") (if True), or sub-questions (like "Which basketball team is called The Chicago Bulls?") (if False)
    USE_PROMPT_THAT_SPLITS_QUESTION_INTO_ENTITIES = True

    # Choose whether to do an addtional walk over the graph JSON file to find additional tables that did not match the user's question, but are necessary to form join paths between those tables
    USE_GRAPH_SEARCH_TO_FIND_JOIN_PATHS = True
