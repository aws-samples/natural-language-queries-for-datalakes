print("PLEASE USE run_tests.py TO RUN THIS MODEULE")

import json
from sqlalchemy import create_engine
from langchain.sql_database import SQLDatabase
import json
import ast
import traceback
import pandas as pd
from config import dgConfig
from utils.logger import Logger
# if dgConfig.ENABLE_ADVANCED_MODE:
# 	from logic_advanced.datagenie import DataGenie
# else:
from logic.datagenie import DataGenie

GOOD_RESULT_MATCH = "GOOD:RESULTS MATCH"
GOOD_RESULT_EXTRA_COLUMNS = "GOOD:RESULT HAS EXTRA COLUMNS"
GOOD_BOTH_EMPTY = "GOOD:BOTH RESULTS ARE EMPTY"
BAD_RESULT_WRONG_ORDER = "BAD:RESULTS MATCH BUT ORDER IS DIFFERENT"
BAD_RESULT_WRONG_ORDER_EXTRA_COLUMNS = "BAD:RESULTS MATCH WITH EXTRA COLUMNS BUT ORDER IS DIFFERENT"
BAD_MISSING_COLUMNS = "BAD:MISSING COLUMNS"
BAD_EXTRA_ROWS = "BAD:GENERATED HAS MORE ROWS THAN EXPECTED"
BAD_MISSING_ROWS = "BAD:GENERATED HAS FEWER ROWS THAN EXPECTED"
BAD_RESULT_MISMATCH = "BAD:RESULT MISMATCH"
BAD_RESULT_GENERATED_QUERY_PRODUCED_NO_DATA = "BAD:GENERATED QUERY PRODUCED NO DATA"
BAD_RESULT_GENERATED_QUERY_PRODUCED_A_SQL_ERROR = "BAD:GENERATED QUERY PRODUCED A SQL ERROR"
UNCLEAR_RESULT_EXPECTED_QUERY_PRODUCED_NO_DATA = "UNCLEAR:EXPECTED QUERY PRODUCED NO DATA"
UNCLEAR_RESULT_EXPECTED_QUERY_PRODUCED_A_SQL_ERROR = "UNCLEAR:EXPECTED QUERY PRODUCED A SQL ERROR"

class SQLTester():
	def __init__(self, database_name="Chinook"):
		self.datagenie = DataGenie()
		self.database_name = database_name

		self.logger = Logger(database_name)

		self.sqllite_url = f"sqlite:///{dgConfig.SQLITE_DATABASES_DIR}/{self.database_name}.db"

		test_list_file = f'{dgConfig.TEST_QUESTIONS_DIR}/{database_name}_tests.json'
		try:
			with open(test_list_file) as f:
				self.question_groups = json.load(f)
		except Exception as e:
			print(f"ERROR: {e} LOADING TEST QUESTIONS FROM {test_list_file}")
			self.question_groups = []


	def _runQuery(self, query, type):
		if not query:
			return "ERROR: No query provided"
		db_name = f"{self.database_name}.db"
		engine_sqlite = create_engine(self.sqllite_url)
		sqlitedb = SQLDatabase(engine_sqlite)

		print(f"\n\nCALLING {type} QUERY: <<{query}>>")
		data_text = ""
		try:
			sql_result = sqlitedb.run(query)
			if sql_result:
				data = ast.literal_eval(sql_result)
				print(f"{type} QUERY RESULT: {len(data)} ROWS")
				data_text = "\n".join(["|".join(str(col) for col in list(row)) for row in data])
		except Exception as e:
			data_text = f"{type} SQL ERROR: {e}"
			print(data_text)
		return data_text


	def _compare_dataframes(self, expected, generated):
		# Check if both are empty
		if expected.empty and generated.empty:
			return GOOD_BOTH_EMPTY

		# Check if expected is empty
		if expected.empty:
			return UNCLEAR_RESULT_EXPECTED_QUERY_PRODUCED_NO_DATA
		
		# Check if generated is empty when expected is not
		if generated.empty:
			return BAD_RESULT_GENERATED_QUERY_PRODUCED_NO_DATA
		
		# Check for missing columns
		missing_columns = set(expected.columns) - set(generated.columns)
		if missing_columns:
			return BAD_MISSING_COLUMNS
		
		# Check for extra columns in generated
		extra_columns_flag = len(generated.columns) > len(expected.columns)
		
		# Align columns and remove extra columns
		common_columns = list(set(expected.columns.tolist()).intersection(set(generated.columns.tolist())))
		expected_aligned = expected[common_columns]
		generated_aligned = generated[common_columns]
		
		# Check for exact match
		if expected_aligned.equals(generated_aligned):
			return GOOD_RESULT_EXTRA_COLUMNS if extra_columns_flag else GOOD_RESULT_MATCH
		
		# Try sorting and check again
		expected_sorted = expected_aligned.sort_values(by=list(expected_aligned.columns)).reset_index(drop=True)
		generated_sorted = generated_aligned.sort_values(by=list(generated_aligned.columns)).reset_index(drop=True)
		
		if expected_sorted.equals(generated_sorted):
			return BAD_RESULT_WRONG_ORDER_EXTRA_COLUMNS if extra_columns_flag else BAD_RESULT_WRONG_ORDER

		if len(expected_sorted) < len(generated_sorted):
			return BAD_MISSING_ROWS

		if len(expected_sorted) > len(generated_sorted):
			return BAD_EXTRA_ROWS

		# If all checks fail, return NO MATCH
		return BAD_RESULT_MISMATCH


	def _compare_csvs(self, expected_csv, result_csv, delimiter):
		try:
			expected_df = pd.read_csv(io.StringIO(expected_csv), sep=delimiter, skipinitialspace=True)
			result_df = pd.read_csv(io.StringIO(result_csv), sep=delimiter, skipinitialspace=True)
			return compare_dataframes(expected_df, result_df)
		except Exception as e:
			print(f"ERROR: {e}")
			return f"ERROR {e} TRYING TO COMPARE RESULTS:\n{expected_csv}\nTO\n{result_csv}\nWITH DELIMITER {delimiter}"


	def run_tests(self, start_with=0, run_up_to=None, run_only_group=None):
		suffix = ""
		if start_with:
			suffix += f"_start_{start_with}"
		if run_only_group:
			suffix += f"_group_{run_only_group}"
		
		IRRELEVANT_NOT_A_SQL_QUESTON = "IRRELEVANT:NOT A SQL QUESTION"

		GOOD_DATABASE_MATCH = "GOOD:DATABASE MATCH"
		GOOD_EXTRA_DATABASES = "GOOD:DATABSE MATCH PLUS EXTRA DATABASES"
		BAD_MISSING_DATABASES = "BAD:DATABSE SET INCOMPLETE"

		GOOD_TABLE_MATCH = "GOOD:TABLE MATCH"
		GOOD_EXTRA_TABLE = "GOOD:TABLE MATCH PLUS EXTRA TABLES"
		BAD_MISSING_TABLES = "BAD:TABLE SET INCOMPLETE"

		UNCLEAR_EXCEPTION_THROWN = "UNCLEAR:EXCEPTION THROWN SOMEWHERE IN DG EXECUTION"

		stats_database = {
			GOOD_DATABASE_MATCH: 0,
			GOOD_EXTRA_DATABASES: 0,
			BAD_MISSING_DATABASES: 0,
			UNCLEAR_EXCEPTION_THROWN: 0
		}

		stats_table = {
			GOOD_TABLE_MATCH: 0,
			GOOD_EXTRA_TABLE: 0,
			BAD_MISSING_TABLES: 0,
			UNCLEAR_EXCEPTION_THROWN: 0
		}

		stats_result = {
			GOOD_RESULT_MATCH: 0,
			GOOD_RESULT_EXTRA_COLUMNS: 0,
			GOOD_BOTH_EMPTY: 0,
			BAD_RESULT_WRONG_ORDER: 0,
			BAD_RESULT_WRONG_ORDER_EXTRA_COLUMNS: 0,
			BAD_MISSING_COLUMNS: 0,
			BAD_EXTRA_ROWS: 0,
			BAD_MISSING_ROWS: 0,
			BAD_RESULT_MISMATCH: 0,
			BAD_RESULT_GENERATED_QUERY_PRODUCED_NO_DATA: 0,
			BAD_RESULT_GENERATED_QUERY_PRODUCED_A_SQL_ERROR: 0,
			UNCLEAR_RESULT_EXPECTED_QUERY_PRODUCED_NO_DATA: 0,
			UNCLEAR_RESULT_EXPECTED_QUERY_PRODUCED_A_SQL_ERROR: 0,
			IRRELEVANT_NOT_A_SQL_QUESTON: 0
		}

		log_header = f"\n\n################################################\n############# TEST RUNNER STARTING {self.database_name} WITH QUESTION {start_with}, RUNNING UP TO {run_up_to}, LIMITING TO GROUP {run_only_group} ####\n"
		self.logger.log(log_header)

		question_count = 0
		group_count = -1
		for question_group in self.question_groups:
			group_count += 1
			question_no = question_group["QUESTION_NO"]
			question_group_no = question_group["GROUP_NO"]
			subquestion_no = question_group["SUBQUESTION_NO"]
			question = question_group["QUESTION"]
			expected_sql = question_group["ANSWER_SQL"]
			expected_databases = question_group["EXPECTED_DATABASES"]
			expected_tables = question_group["EXPECTED_TABLES"]
			for keyword in ["FROM ","WHERE ", "JOIN ", "GROUP BY ", "ORDER BY ", "HAVING ", "LIMIT "]:
				expected_sql = expected_sql.replace(keyword, f"\n{keyword}")  
			if subquestion_no == 0:
				conversation_history = []
				group_question_count = 0
			group_question_count += 1

			if start_with and question_no < start_with:
				print(f"SKIPPING QUESTION {question_no} < {start_with}")
				continue

			if run_up_to and question_no > run_up_to:
				print(f"SKIPPING QUESTION {question_no} > {run_up_to}")
				continue

			if run_only_group and question_group_no != run_only_group:
				print(f"SKIPPING QUESTION {question_no} IN GROUP {group_count+1} TO RUN ONLY GROUP {run_only_group}")
				continue

			question_count += 1

			conversation_history_string = "\n\n".join(conversation_history)

			log_header = f"\n\n################################################\n############# {self.database_name} QUESTION {question_no} of {len(self.question_groups)} (GROUP {question_group_no}, SUBQUESTION {subquestion_no}, QUESTION {group_question_count} IN THIS GROUP): {question}\n\nSQL:\n"
			self.logger.log(log_header)
			self.logger.set_question_number(question_no)
			self.logger.log(question, "QUESTION")

			generated_answer = dg_sql = UNCLEAR_EXCEPTION_THROWN
			dg_databases = dg_tables = [UNCLEAR_EXCEPTION_THROWN]
			try:
				dg_answer = self.datagenie.answer(question) 
				generated_answer, dg_sql, dg_tables, dg_databases = dg_answer["response"], dg_answer["sql_statement"], dg_answer["table_list"], dg_answer["database_list"]
			except Exception as e:
				generated_answer = f"DATA GENIE EXCEPTION: {e}\nSTACK TRACE: {traceback.format_exc()}"
				print(generated_answer)

			self.logger.log(dg_databases, "DATAGENIE DATABASES")
			self.logger.log(expected_databases, "EXPECTED DATABSES")
			database_set_evaluation = "UNKNOWN"
			dg_databases = set(dg_databases)
			expected_databases = set(expected_databases)
			if dg_databases == {UNCLEAR_EXCEPTION_THROWN}:
				database_set_evaluation = UNCLEAR_EXCEPTION_THROWN
			elif dg_databases == expected_databases:
				database_set_evaluation = GOOD_DATABASE_MATCH
			elif expected_databases.issubset(dg_databases):
				database_set_evaluation = GOOD_EXTRA_DATABASES
			else:
				database_set_evaluation = BAD_MISSING_DATABASES
			self.logger.log(database_set_evaluation, "DATABSE SET EVALUATION")
			if database_set_evaluation not in stats_database:
				stats_database[database_set_evaluation] = 0
			stats_database[database_set_evaluation]+=1


			self.logger.log(dg_tables, "DATAGENIE TABLES")
			self.logger.log(expected_tables, "EXPECTED TABLES")
			table_set_evaluation = "UNKNOWN"
			dg_tables = set(dg_tables)
			expected_tables = set(expected_tables)
			if dg_tables == {UNCLEAR_EXCEPTION_THROWN}:
				table_set_evaluation = UNCLEAR_EXCEPTION_THROWN
			elif dg_tables == expected_tables:
				table_set_evaluation = GOOD_TABLE_MATCH
			elif expected_tables.issubset(dg_tables):
				table_set_evaluation = GOOD_EXTRA_TABLE
			else:
				table_set_evaluation = BAD_MISSING_TABLES
			self.logger.log(table_set_evaluation, "TABLE SET EVALUATION")
			if table_set_evaluation not in stats_table:
				stats_table[table_set_evaluation] = 0
			stats_table[table_set_evaluation]+=1


			self.logger.log(generated_answer, "DATAGENIE RESULT")
			self.logger.log(dg_sql, "DATAGENIE QUERY")
			self.logger.log(expected_sql, "EXPECTED SQL")

			data_text = self._runQuery(dg_sql, "GENERATED")
			data_text = str(data_text).strip()
			data_text_trimmed = "FIRST 10 ROWS:\n" + "\n".join(data_text.split("\n")[:10]) 

			expected_data_text = self._runQuery(expected_sql, "EXPECTED")
			expected_data_text = str(expected_data_text).strip()
			expected_data_text_trimmed = "FIRST 10 ROWS:\n" + "\n".join(expected_data_text.split("\n")[:10])

			conversation_history.append(f"user: {question}")
			conversation_history.append(f"assistant:\n<QUERY:>\n{dg_sql}\n</QUERY>\n<RESULT>\n{data_text}\n<RESULT>\n")

			explanation = evaluation = "NOT SQL"
			if not expected_data_text:
				explanation = evaluation = UNCLEAR_RESULT_EXPECTED_QUERY_PRODUCED_NO_DATA
			elif data_text == expected_data_text:
				explanation = evaluation = GOOD_RESULT_MATCH
			elif not data_text or data_text == "None":
				explanation = evaluation = BAD_RESULT_GENERATED_QUERY_PRODUCED_NO_DATA
			elif "error" in expected_data_text.lower() or "exception" in expected_data_text.lower():
				explanation = evaluation = UNCLEAR_RESULT_EXPECTED_QUERY_PRODUCED_A_SQL_ERROR
			elif "error" in data_text.lower() or "exception" in data_text.lower():
				explanation = evaluation = BAD_RESULT_GENERATED_QUERY_PRODUCED_A_SQL_ERROR
			else:
				print(f"CONTINUING TO DATA COMPARISON")
				explanation = self._compare_csvs(expected_data_text, data_text, "|")

			self.logger.log(data_text_trimmed, "RESULT")
			self.logger.log(expected_data_text_trimmed, "EXPECTED RESULT")

				
			self.logger.log(explanation, "EXPLANATION")
			self.logger.log(evaluation, "EVALUATION")

			if evaluation not in stats_result:
				stats_result[evaluation] = 0
			stats_result[evaluation] += 1

			parameters = dgConfig().getParametersString()
			result_stats_text = f"""\n
################################################################################################################################################
COMPLETED {question_count} TESTS ({self.database_name} ; {parameters}). STATS SO FAR:
"""

			result_stats_text += f"\n###################### DATABASE SELECTION STATS ##########################\n"
			for stat, stat_count in stats_database.items():
				if stat_count == 0:
					continue
				percent = int(round((100 * stat_count / (question_count)), 0))
				result_stats_text += f"{stat}: {stat_count} ({percent}%)\n"

			result_stats_text += f"\n###################### TABLE SELECTION STATS ##########################\n"
			for stat, stat_count in stats_table.items():
				if stat_count == 0:
					continue
				percent = int(round((100 * stat_count / (question_count)), 0))
				result_stats_text += f"{stat}: {stat_count} ({percent}%)\n"

			result_stats_text += f"\n###################### SQL RESULT STATS ##########################\n"
			for stat, stat_count in stats_result.items():
				if stat_count == 0:
					continue
				percent = int(round((100 * stat_count / (question_count)), 0))
				result_stats_text += f"{stat}: {stat_count} ({percent}%)\n"
			result_stats_text += f"\n################################################\n\n"
			self.logger.log(result_stats_text)
			self.logger.save_stats()
		return result_stats_text
