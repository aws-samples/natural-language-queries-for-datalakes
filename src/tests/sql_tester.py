print("PLEASE USE run_tests.py TO RUN THIS MODEULE")

import json
from sqlalchemy import create_engine
from langchain.sql_database import SQLDatabase
import json
import ast
import traceback
from logic.datagenie import DataGenie
from logic.config import dgConfig
from utils.logger import Logger


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

	def _equalWithExtraColumns(self, expected, generated):
		print(f"COMPARING EXPECTED:\n{expected}\nWITH GENERATED:\n{generated}\n")
		try:
			if not expected and not generated:
				return True, "BOTH RESULTS ARE EMPTY"
			elif not expected or not generated:
				return False, "ONE OF THE RESULTS IS EMPTY"
			else:
				expected_data = expected.split("\n")
				generated_data = generated.split("\n")
				if len(generated_data) < len(generated_data):
					return False, f"GENERATED DATA HAS FEWER ROWS THAN EXPECTED"
				for i in range(len(expected_data)):
					if expected_data[i] not in generated_data[i]:
						return False, f"RESULTS ARE NOT A SUBSET AT ROW {i}: EXPECTED {expected_data[i]} NOT IN GENERATED {generated_data[i]}"
				return True, "RESULTS ARE A SUBSET FOR ALL COLUMNS IN EXPECTED DATASET"
		except Exception as e:
			print(f"ERROR: {e}")
			return False, f"ERROR {e} TRYING TO COMPARE RESULTS"


	def run_tests(self, start_with=0, run_up_to=None, run_only_group=None):
		suffix = ""
		if start_with:
			suffix += f"_start_{start_with}"
		if run_only_group:
			suffix += f"_group_{run_only_group}"

		GOOD_MATCH = "GOOD:MATCH"
		GOOD_EXTRA_COLUMNS = "GOOD:EXTRA COLUMNS"
		BAD_MISMATCH = "BAD:MISMATCH"
		BAD_GENERATED_QUERY_PRODUCED_NO_DATA = "BAD:GENERATED QUERY PRODUCED NO DATA"
		BAD_GENERATED_QUERY_PRODUCED_A_SQL_ERROR = "BAD:GENERATED QUERY PRODUCED A SQL ERROR"
		UNCLEAR_EXPECTED_QUERY_PRODUCED_NO_DATA = "UNCLEAR:EXPECTED QUERY PRODUCED NO DATA"
		UNCLEAR_EXPECTED_QUERY_PRODUCED_A_SQL_ERROR = "UNCLEAR:EXPECTED QUERY PRODUCED A SQL ERROR"
		IRRELEVANT_NOT_A_SQL_QUESTON = "IRRELEVANT:NOT A SQL QUESTION"

		stats_text = "UNKNOWN"
		stats_summary_detail = {
			GOOD_MATCH: 0,
			GOOD_EXTRA_COLUMNS: 0,
			BAD_MISMATCH: 0,
			BAD_GENERATED_QUERY_PRODUCED_NO_DATA: 0,
			BAD_GENERATED_QUERY_PRODUCED_A_SQL_ERROR: 0,
			UNCLEAR_EXPECTED_QUERY_PRODUCED_NO_DATA: 0,
			UNCLEAR_EXPECTED_QUERY_PRODUCED_A_SQL_ERROR: 0,
			IRRELEVANT_NOT_A_SQL_QUESTON: 0
		}

		group_count = -1
		for question_group in self.question_groups:
			group_count += 1
			(question_count, question_group_no, subquestion_no, question, expected_sql) = (question_group["QUESTION_NO"], question_group["GROUP_NO"], question_group["SUBQUESTION_NO"], question_group["QUESTION"], question_group["ANSWER_SQL"])
			for keyword in ["FROM ","WHERE ", "JOIN ", "GROUP BY ", "ORDER BY ", "HAVING ", "LIMIT "]:
				expected_sql = expected_sql.replace(keyword, f"\n{keyword}")  
			if subquestion_no == 0:
				conversation_history = []
				group_question_count = 0
			group_question_count += 1

			if start_with and question_count < start_with:
				print(f"SKIPPING QUESTION {question_count} < {start_with}")
				continue

			if run_up_to and question_count > run_up_to:
				print(f"SKIPPING QUESTION {question_count} > {run_up_to}")
				continue

			if run_only_group and question_group_no != run_only_group:
				print(f"SKIPPING QUESTION {question_count} IN GROUP {group_count+1} TO RUN ONLY GROUP {run_only_group}")
				continue

			conversation_history_string = "\n\n".join(conversation_history)

			log_header = f"\n\n################################################\n############# QUESTION {question_count} of {len(self.question_groups)} (SUBQUESTION {subquestion_no}, QUESTION {group_question_count}): {question}\n\nSQL:\n"
			self.logger.log(log_header)

			generated_answer, dg_sql = "UNKNOWN - DATA GENIE EXCEPTION", ""
			try:
				dg_answer = self.datagenie.answer(question)
				generated_answer, dg_sql = dg_answer["response"], dg_answer["sql_statement"]
			except Exception as e:
				generated_answer = f"DATA GENIE EXCEPTION: {e}\nSTACK TRACE: {traceback.format_exc()}"
				print(generated_answer)

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
				explanation = evaluation = UNCLEAR_EXPECTED_QUERY_PRODUCED_NO_DATA
			elif data_text == expected_data_text:
				explanation = evaluation = GOOD_MATCH
			elif not data_text or data_text == "None":
				explanation = evaluation = BAD_GENERATED_QUERY_PRODUCED_NO_DATA
			elif "error" in expected_data_text.lower() or "exception" in expected_data_text.lower():
				explanation = evaluation = UNCLEAR_EXPECTED_QUERY_PRODUCED_A_SQL_ERROR
			elif "error" in data_text.lower() or "exception" in data_text.lower():
				explanation = evaluation = BAD_GENERATED_QUERY_PRODUCED_A_SQL_ERROR
			else:
				print(f"CONTINUING TO DATA COMPARISON")
				subset, explanation = self._equalWithExtraColumns(expected_data_text, data_text)
				if subset: 
					evaluation = GOOD_EXTRA_COLUMNS
				else:
					evaluation = BAD_MISMATCH

			self.logger.log(data_text_trimmed, "RESULT")
			self.logger.log(expected_data_text_trimmed, "EXPECTED RESULT")

				
			self.logger.log(explanation, "EXPLANATION")
			self.logger.log(evaluation, "EVALUATION")

			if evaluation not in stats_summary_detail:
				stats_summary_detail[evaluation] = 0
			stats_summary_detail[evaluation] += 1

			stats_text = f"\n\n################################################\nCOMPLETED {question_count} TESTS. STATS SO FAR:\n"
			for stat, stat_count in stats_summary_detail.items():
				if stat_count == 0:
					continue
				percent = int(round((100 * stat_count / (question_count)), 0))
				stats_text += f"{stat}: {stat_count} ({percent}%)\n"
			stats_text += f"################################################\n\n"
			self.logger.log(stats_text)
		return stats_text


if __name__ == "__main__":
	tester = SQLTester(database_name="northwind")
	stats = tester.run_tests(start_with=0, run_up_to=1, run_only_group=1)
	print(f"FINAL STATS: {stats}")
