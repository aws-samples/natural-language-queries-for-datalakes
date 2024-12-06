import codecs
import re
from utils.bcolors import Bcolors
import ast
import json
from utils.logger import Logger
from config import dgConfig
from logic_advanced.metadata import Metadata

class SqlQuery():
    
    def __init__(self, language_model, database_connectors):
        self.language_model = language_model
        self.database_connectors = database_connectors        
        self.logger = Logger()
        self.metadata = Metadata()
    
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

    def _stripTag(self, text, tag):
        text = re.sub(f"\n","<BR>",text)
        text = re.sub(f"^.*<{tag}>","",text)
        text = re.sub(f"</{tag}>.*$","",text)
        text = re.sub(f"<BR>","\n",text)
        text = text.strip()
        return text


    def _format_output(self, s):
        """
        Format output to be displayed in the chat window
        """
        s = s.replace("<THINKING>", "\n#### Thinking - Which columns are needed\n")
        s = s.replace("</THINKING>", "\n")
        s = s.replace("<SQL>", "\n#### Generated SQL\n```sql\n")
        s = s.replace("</SQL>", "\n```\n")
        s = s.replace("<EXPLANATION>", "\n#### Explanation\n")
        s = s.replace("</EXPLANATION>", "\n")

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
        
        channel, db = self.set_db(tables_to_use) # set db according to the result of previous channel function
        dialect = "sqlite3"

        print()
        print("******************* STEP 2 ***********************")
        print("*                                                *")
        print("*          Generate and execute SQL (NEW)        *")
        print("*                                                *")
        print("**************************************************")
        print()

        print(f"TABLES_TO_USE:\n{tables_to_use}\n")
 
        if not dgConfig.RUN_SQL:
            print("SQL generation is skipped due to configuration")
            response = {
                'sql_query': "SKIPPED SQL GENERATION PER CONFIG",
                'sql_result': "SKIPPED SQL GENERATION PER CONFIG",
                'table_info': "SKIPPED SQL GENERATION PER CONFIG",
                'display_response': "SKIPPED SQL GENERATION PER CONFIG",
            }
            return response

        # Get database name
        database = tables_to_use['database']

        # Get table name
        tables = tables_to_use['table']

        disambiguated_question = tables_to_use['disambiguated_question']

        all_table_ddl = self.metadata.get_table_ddl(database, tables, asXML=True, verbose=False)

        print("Table info: ")
        print(all_table_ddl)
        print()

        refusal_option = "If the SQL query is not possible, return the keyword ERROR." if dgConfig.ALLOW_SQL_GENERATION_REFUSAL else ""

        system_prompt = "You are an expert SQL developer and data analyst."

        # Generate SQL query with the LLM
        prompt = f"""Read the list of available tables in the <DDL> tag and the shortest join path between these tables in the <JOIN_PATH> tag, then the user question in the <QUESTION> tag.

<DDL>
{all_table_ddl}
</DDL>

<JOIN_PATH>
{set(tables)}
</JOIN_PATH>

<QUESTION>
{disambiguated_question}
</QUESTION>

Write out a <THINKING> tag containing the list of column names from the <DDL> tag (in table.column format) that would be needed to answer the question and.
Ensure that the data you select actually answers the user question by selecting from appropriate tables and using the appropriate WHERE clauses to limit the data.
Ensure that every column you'll need in your query (for the SELECT, WHERE, JOIN, GROUP, ORDER, etc. clauses) is listed in the <THINKING> tag.
Use only tables and columns mentioned in the <JOIN_PATH> tag to write the SQL query.
Then write a <SQL> tag containing a SQL query to get the information required to answer the question.
Use the <JOIN_PATH> to help you find indirect links between tables.
Unless the question explicitly asks for ID numbers, always select names that correspond to any IDs in your answer instead of the ID numbers.
For columns that contain binary blobs, instead of selecting the column value, select the hard coded value "UNABLE TO DISPLAY BINARY DATA" instead.
Then explain your work in an <EXPLANATION> tag, including details about the syntax used like single quotes, double quotes, etc.

{refusal_option}

Ensure that the SQL query complies with {dialect} syntax. 
For instance in SQLite, the column and table names should be enclosed in double quotes and the query should always end with a semicolon.

"""

        print("\nPrompt for SQL generation:")
        print(Bcolors.OKGREEN + prompt + Bcolors.ENDC)
        
        header = "\n\n### Step 2a: SQL query generation\n"
        
        def concatenate_texts(s):
            for special in ["<", "SELECT", "FROM", "WHERE", "JOIN", "GROUP", "ORDER", "HAVING", "LIMIT"]:
                s = s.replace(special, f"\n{special}")
            s.replace('>', '>\n')
            return previous_display + header + s

        def callback(completion):
            s = self._format_output(completion)
            if message_placeholder is not None:
                message_placeholder.markdown(concatenate_texts(s) + "▌")

        generated_text = self.language_model.invoke_with_stream_callback(dgConfig.LLM_VERSION_FOR_SQL, prompt, callback, system_prompt=system_prompt)

        display_text = concatenate_texts(self._format_output(generated_text))

        print(Bcolors.OKCYAN + generated_text + Bcolors.ENDC)
        
        sql_query = self._stripTag(generated_text, "SQL")
        explanation = self._stripTag(generated_text, "EXPLANATION")

        self.logger.log(sql_query, "SQL_QUERY: sql_query")
        self.logger.log(explanation, "SQL_QUERY: explanation")

        # Execute SQL query

        if channel=='athenadb' or channel=='postgresql' or channel=='sqlite':
            print(f"RUNNING SQL: <<<{sql_query}>>>")
            sql_result_columns = None
            try:
                sql_result_columns = db.run(sql_query, include_columns=True)
                print(f"RAW SQL COLUMNS: <<<{sql_result_columns}>>>")
                if sql_result_columns:
                    sql_result_columns = ast.literal_eval(sql_result_columns)
                    sql_result_columns = list(sql_result_columns[0].keys())
                    print(f"RAW SQL COLUMNS: <<<{sql_result_columns}>>>")
            except:
                print("UNABLE TO RETRIEVE COLUMN NAMES")
            sql_result = db.run(sql_query)
            print(f"RAW SQL RESULT: <<<{sql_result}>>>")
            sql_result = self.clean_sql_result(sql_result)
            print(f"CLEANED SQL RESULT: <<<{sql_result}>>>")
            sql_result = f"{sql_result_columns}\n{sql_result}"
            print(f"FINAL SQL RESULT: <<<{sql_result}>>>")

            self.logger.log(sql_result, "SQL_QUERY: sql_result")

            # Display SQL result
            header_2 = "\n\n### Step 2b: Result of SQL query execution\n"
            display_text += header_2 + "```json" + sql_result + "\n```\n"
            if message_placeholder is not None:
                message_placeholder.markdown(display_text + "▌")
            
            # Prepare response
            response = {
                'sql_query': sql_query,
                'sql_result': sql_result,
                'table_info': all_table_ddl,
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
