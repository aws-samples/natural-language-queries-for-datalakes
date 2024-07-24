class dgConfig():
    # Set to True if you want to enable auth for the Streamlit frontend
    ENABLE_AUTH = False
    
    # Path to data catalog files  
    DATA_CATALOG_DIR = "./example_data/datalake/metadata/"
    
    # Path to Sqlite databases
    SQLITE_DATABASES_DIR = "./example_data/datalake/data"
    
    # Path to system and test logs
    LOG_FILE_DIR = "./logs"

    # Path to Sqlite databases
    TEST_QUESTIONS_DIR = "./tests/test_sets"
