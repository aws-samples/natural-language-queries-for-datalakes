from sqlalchemy import create_engine
from langchain.sql_database import SQLDatabase
from logic.config import dgConfig

class DatabaseConnectors():

    def __init__(self):
        pass
        
    def get_sqlite_database(self, db_name):
        sqllite_url = f"sqlite:///{dgConfig.SQLITE_DATABASES_DIR}/{db_name}"
        engine_sqlite = create_engine(sqllite_url)
        sqlitedb = SQLDatabase(engine_sqlite)
        return sqlitedb
    
    # Example code for connecting to Athena or Postgresql
    # You will need to adapt it to your use case
    #
    # def get_athena_database(self, region, glue_database_name, glue_databucket_name):
    #     ## athena variables
    #     connathena=f"athena.{region}.amazonaws.com" 
    #     portathena='443'
    #     schemaathena=glue_database_name
    #     s3stagingathena=f's3://{glue_databucket_name}/athenaresults/'#from cfn params
    #     wkgrpathena='primary  # Update, if workgroup is different
    #     ##  Create the athena connection string
    #     connection_string = f"awsathena+rest://@{connathena}:{portathena}/{schemaathena}?s3_staging_dir={s3stagingathena}/&work_group={wkgrpathena}"
    #     ##  Create the athena  SQLAlchemy engine
    #     engine_athena = create_engine(connection_string, echo=False)
    #     dbathena = SQLDatabase(engine_athena)
    #     # dbathena = SQLDatabase(engine_athena, include_tables=tablesathena)
    #     return dbathena
    #
    # def get_postgresql_database(self, pg_connection_string, pg_database_name):
    #     engine_postgres = create_engine(f"{pg_connection_string}/{pg_database_name}", echo=False)
    #     dbpostgres = SQLDatabase(engine_postgres)
    #     return dbpostgres

