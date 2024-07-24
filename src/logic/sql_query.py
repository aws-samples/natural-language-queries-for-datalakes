import codecs
import re
from utils.bcolors import Bcolors
import ast
import json

class SqlQuery():
    
    def __init__(self, language_model, database_connectors):
        self.language_model = language_model
        self.database_connectors = database_connectors        
    
    def set_db(self, tables_to_use):
        
        #set the best channel from where the query can be answered
        if tables_to_use['channel'] is None:
            raise Exception("User question cannot be answered by any of the channels mentioned in the catalog")
        if 'sqlite' in tables_to_use['channel']:
            channel='sqlite'
            database = tables_to_use['database']
            db=self.database_connectors.get_sqlite_database(database)
            print("SET database to sqlite. Database: ", db, '\n')
        elif 'athenadb' in tables_to_use['channel']: 
                channel='athenadb'
                database = tables_to_use['database']
                db=self.database_connectors.get_athena_database(database)
                print("SET database to athena. Database: ", database, '\n')
        elif 'postgresql' in tables_to_use['channel']:
            channel = 'postgresql'
            database = tables_to_use['database']
            db = self.database_connectors.get_postgresql_database(database)
            print("SET database to postgresql. Database: ", database, "\n")
        elif 'api' in tables_to_use['channel']: 
                channel='api'
                db=None
                print("SET database to weather api")        
        else: raise Exception("User question cannot be answered by any of the channels mentioned in the catalog")

        return channel, db    

    def _format_output(self, s):
        """
        Format output to be displayed in the chat window
        """
        s = s.replace("<result>", "")
        s = s.replace("</result>", "")
        s = s.replace("<sql>", "\n#### SQL query generated\n")
        s = s.replace("</sql>", "\n")
        s = s.replace("<sql_explanation>", "\n#### Explanation of SQL query generation\n")
        s = s.replace("</sql_explanation>", "\n")
        s = s.replace("<sql_result>", "\n#### Sql query result\n")
        s = s.replace("</sql_result>", "\n\n")

        return s

    # Transform any string into a sqlite identifier, escape special characters, enclose in quotes
    def _escape_table_name(self, s, errors="strict"):
        encodable = s.encode("utf-8", errors).decode("utf-8")

        nul_index = encodable.find("\x00")

        if nul_index >= 0:
            error = UnicodeEncodeError("NUL-terminated utf-8", encodable,
                                    nul_index, nul_index + 1, "NUL not allowed")
            error_handler = codecs.lookup_error(errors)
            replacement, _ = error_handler(error)
            encodable = encodable.replace("\x00", replacement)

        return "\"" + encodable.replace("\"", "\"\"") + "\""


    def clean_sql_result(self, result):
        ### Strip out binary blobs in the data which are useless to the LLM and dramatically slow down prompts
        try:
            data = ast.literal_eval(result)
            clean_data = []
            for row in data:
                clean_row = []
                for col in list(row):
                    if isinstance(col, bytes): 
                        col = "BINARY_DATA"
                    clean_row.append(col)
                clean_data.append(clean_row)
            result = json.dumps(clean_data)
        except Exception as e:
            print(f"ERROR CLEANING SQL RESULT: <<{e}>> FOR RESULT SET <<{result}>>")
        return result


    def generate_sql(self, question, tables_to_use=None, message_placeholder=None, previous_display=""):
        
        print()
        print("******************* STEP 2 ***********************")
        print("*                                                *")
        print("*          Generate and execute SQL              *")
        print("*                                                *")
        print("**************************************************")
        print()
 
        channel, db = self.set_db(tables_to_use) # set db according to the result of previous channel function

        ##Prompt 2 'Run Query'
        #after determining the data channel, run the Langchain SQL Database chain to convert 'text to sql' and run the query against the source data channel. 
        #provide rules for running the SQL queries in default template--> table info.

        docs_tables = ""
        for doc in tables_to_use['document']:
            docs_tables += str(tables_to_use['document']) \
                            .replace('{', '{{') \
                            .replace('}', '}}')
            docs_tables += "\n"
                        
        # Get table name
        tables = tables_to_use['table']
        
        # Get table info from the database (schema and sample rows)
        table_info = ""
        for table in tables:
            if channel=='sqlite':
                # Escape table name parameter
                table = self._escape_table_name(table)

                # Get schema
                sql_query_get_schema = f"PRAGMA table_info({table});"
                sql_result_schema = db.run(sql_query_get_schema)
                
                # Get sample rows
                sql_query_get_sample_rows = f"SELECT * FROM {table} ORDER BY RANDOM() LIMIT 5;"
                print(f"SQL CHANNEL = {channel}; QUERY: {sql_query_get_sample_rows}")
                sql_result_sample_rows = db.run(sql_query_get_sample_rows)
                sql_result_sample_rows = self.clean_sql_result(sql_result_sample_rows)
                
                dialect = 'SQLite'

            # Example code for getting table schema and sample rows from athena
            # You will need to escape the parameters for security, or parametrize the query
            #                
            # elif channel=='athenadb':
            #     # Get schema
            #     sql_query_get_schema = f"""SELECT column_name, data_type
            #         FROM information_schema.columns
            #         WHERE table_name   = '{table}'
            #     """
            #     sql_result_schema = db.run(sql_query_get_schema)                
            #     # Get sample rows
            #     sql_query_get_sample_rows = f"""SELECT *
            #         FROM {table}
            #         ORDER BY RAND()
            #         LIMIT 5"""
            #     sql_result_sample_rows = db.run(sql_query_get_sample_rows)
            #     dialect = 'Athena'

            # Example code for getting table schema and sample rows from PostgreSQL database
            # You will need to escape the parameters for security, or parametrize the query
            #
            # elif channel=='postgresql':
            #     # Get schema
            #     schema_name, table_name = tuple(table.split("."))
            #     sql_query_get_schema = f"""SELECT column_name, data_type
            #         FROM information_schema.columns
            #         WHERE table_schema = '{schema_name}'
            #         AND table_name   = '{table_name}';
            #     """
            #     sql_result_schema = db.run(sql_query_get_schema)                    
            #     # Get sample rows
            #     sql_query_get_sample_rows = f"""SELECT *
            #         FROM {table}
            #         ORDER BY random()
            #         LIMIT 5"""
            #     sql_result_sample_rows = db.run(sql_query_get_sample_rows)            
            #     dialect = 'Postgresql'
            
            else:
                raise Exception("Unlisted channel. Check your unified catalog")
    
            table_info += f"<table_info table={table}>\n"
            table_info += f"Table schema: {sql_result_schema}\n"
            table_info += f"Sample rows: {sql_result_sample_rows}\n"
            table_info += "</table_info>"
            
        # table_info = self.clean_sql_result(table_info)

        print("Table info: ")
        print(table_info)
        print()
        print("Metadata documents for tables: ")
        print(docs_tables)

        # Generate SQL query with the LLM
        prompt = f"""\n\nHuman: Given an input question, create a SQL query to get from the database the information required to answer the question.
        It is important that the SQL query complies with {dialect} syntax. For instance in SQLite, the column and table names should be enclosed in double quotes. It is also important to respect the type of columns: if a column is numeric, the value should not be enclosed in quotes.

        Business data catalog information about the table are given in <tabledesc> tags.
        Information about the table schema and example rows are given in <tableinfo> tags.
        The input question is given in <question> tags.
        
        <tabledesc>{docs_tables}</tabledesc>
        <tableinfo>{table_info}</tableinfo>
        <question>{question}</question>
        
        Give your answer in the following xml format: <result><sql>Generated SQL query</sql><sql_explanation>Explain what you have done and give details about the syntax used like single quotes, double quotes, and so on.</sql_explanation></result>
        For columns that contain binary blobs, instead of selecting the column value, select the hard coded value "UNABLE TO DISPLAY BINARY DATA" instead.
        
        If the answer is not possible, the Generated SQL query should be replaced with the keyword ERROR.
        
        Important: you must comply with {dialect} SQL syntax.
        
        \n\nAssistant:
        """

        print("\nPrompt for SQL generation:")
        print(Bcolors.OKGREEN + prompt + Bcolors.ENDC)
        
        header = "\n\n### Step 2a: SQL query generation\n"
        
        def concatenate_texts(s):
            return previous_display + header + s

        def callback(completion):
            s = self._format_output(completion)
            if message_placeholder is not None:
                message_placeholder.markdown(concatenate_texts(s) + "▌")

        generated_text = self.language_model.invoke_with_stream_callback(prompt, callback)

        display_text = concatenate_texts(self._format_output(generated_text))

        print(Bcolors.OKCYAN + generated_text + Bcolors.ENDC)
        
        sql_query = generated_text.split("<sql>")[1].split("</sql>")[0]
        explanation = generated_text.split("<sql_explanation>")[1].split("</sql_explanation>")[0]
        
        # Execute SQL query

        if channel=='athenadb' or channel=='postgresql' or channel=='sqlite':
            print(f"RUNNING SQL: <<<{sql_query}>>>")
            sql_result = db.run(sql_query)
            sql_result = self.clean_sql_result(sql_result)
            print(f"GOT SQL RESULT: <<<{sql_result}>>>")
            
            # Display SQL result
            header_2 = "\n\n### Step 2b: Result of SQL query execution\n"
            display_text += header_2 + sql_result + "\n"
            if message_placeholder is not None:
                message_placeholder.markdown(display_text + "▌")
            
            # Prepare response
            response = {
                'sql_query': sql_query,
                'sql_result': sql_result,
                'table_info': table_info,
                'display_response': display_text,
            }
            
            print()

            print("*******************************************************")
            print()            
            print("SQL Query generated:")
            print(sql_query)
            print()
            print("*******************************************************")
            print()            
            print("Explanation generated:")
            print(explanation)
            print()
            print("*******************************************************")
            print()            
            print("SQL Result:")
            print(sql_result)
            print()
        else:
            raise Exception("Unlisted channel. Check your unified catalog")
        return response