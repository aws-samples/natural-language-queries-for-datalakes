print("PLEASE USE run_tests.py TO RUN THIS MODEULE")

import json
import os
import datetime
from sqlalchemy import create_engine
from langchain.sql_database import SQLDatabase
import json
import ast
from logic.datagenie import DataGenie
from logic.config import dgConfig

class SQLTester():
    def __init__(self, database_name="Chinook"):
        self.datagenie = DataGenie()
        self.database_name = database_name

        self.log_file_name = f"{dgConfig.LOG_FILE_DIR}/sql_tester_{database_name}_{datetime.datetime.now().strftime('%Y%m%d_%H%M%S')}.log"
        with open(self.log_file_name, "w") as logfile:
            logfile.write(f"SQL TEST: {datetime.datetime.now().strftime('%I:%M%p on %B %d, %Y')}")

        self.sqllite_url = f"sqlite:///{dgConfig.SQLITE_DATABASES_DIR}/{self.database_name}.db"

        test_list_file = f'{dgConfig.TEST_QUESTIONS_DIR}/{database_name}_tests.json'
        try:
            with open(test_list_file) as f:
                self.question_groups = json.load(f)
        except Exception as e:
            print(f"ERROR: {e} LOADING TEST QUESTIONS FROM {test_list_file}")
            self.question_groups = []


    def _log(self, text, tag=None):
        log_text = ""
        if tag:
            log_text = f"\n<{tag}>\n{text}\n</{tag}>\n"
        else:
            log_text = f"{text}\n"

        print(log_text)
        with open(self.log_file_name, "a") as logfile:
                logfile.write(log_text)


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

        stats = {}
        stats_summary = {"GOOD": 0, "BAD": 0, "UNCLEAR": 0, "IRRELEVANT": 0}
        stats_summary_types = {
            "MATCH": "GOOD",
            "EXTRA COLUMNS": "GOOD",
            "MISMATCH": "BAD",
            "GENERATED QUERY PRODUCED NO DATA": "BAD",
            "GENERATED QUERY PRODUCED A SQL ERROR": "BAD",
            "EXPECTED QUERY PRODUCED NO DATA": "UNCLEAR",
            "EXPECTED QUERY PRODUCED A SQL ERROR": "UNCLEAR",
            "NOT SQL": "IRRELEVANT"
        }

        group_count = -1
        for question_group in self.question_groups:
            group_count += 1
            (question_count, question_group_no, subquestion_no, question, expected_disambiguated_question, expected_sql) = (question_group["QUESTION_NO"], question_group["GROUP_NO"], question_group["SUBQUESTION_NO"], question_group["QUESTION"], question_group["DISAMBIGUATED_QUESTION"], question_group["ANSWER_SQL"])
            for keyword in ["FROM ","WHERE ", "JOIN ", "GROUP BY ", "ORDER BY ", "HAVING ", "LIMIT "]:
                expected_sql = expected_sql.replace(keyword, f"\n{keyword}")  
            if subquestion_no == 0:
                conversation_history = []
                group_question_count = 0
            group_question_count += 1

            if start_with and question_count < start_with:
                print(f"SKIPPING QUESTION {question_count}")
                continue

            if run_up_to and question_count > run_up_to:
                print(f"SKIPPING QUESTION {question_count}")
                continue

            if run_only_group and question_group_no != run_only_group:
                print(f"SKIPPING QUESTION {question_count} IN GROUP {group_count+1} TO RUN ONLY GROUP {run_only_group}")
                continue

            conversation_history_string = "\n\n".join(conversation_history)

            log_header = f"\n\n################################################\n############# QUESTION {question_count} of {len(self.question_groups)} (SUBQUESTION {subquestion_no}, QUESTION {group_question_count}): {question}\n\nSQL:\n"
            self._log(log_header)

            # disambiguated_question, intent, required_tables = runIntentAndDisambiguation(question, conversation_history_string, tables, jargon)
            # disambiguated_question, intent, required_tables = None, None, None

            # self._log(intent, "INTENT")
            # self._log(disambiguated_question, "DISAMBIGUATED QUESTION")
            # self._log(required_tables, "REQUIRED TABLES")

            dg_answer, dg_sql = "UNKNOWN - DATA GENIE EXCEPTION", ""
            try:
                dg_answer, dg_sql = self.datagenie.answer(question)
            except Exception as e:
                dg_answer = f"DATA GENIE EXCEPTION: {e}"
                print(dg_answer)

            # thinking, query = generateSQL(disambiguated_question, ddl_dict, ddl_general_commment, jargon, required_tables)
            # thinking, query = None, expected_sql

            # self._log(thinking, "THINKING")
            self._log(dg_answer, "DATAGENIE RESULT")
            self._log(dg_sql, "DATAGENIE QUERY")
            self._log(expected_sql, "EXPECTED SQL")
            self._log(expected_disambiguated_question, "EXPECTED DISAMBIGUATED QUESTION")

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
                explanation = evaluation = "EXPECTED QUERY PRODUCED NO DATA"
            elif data_text == expected_data_text:
                explanation = evaluation = "MATCH"
            elif not data_text or data_text == "None":
                explanation = evaluation = "GENERATED QUERY PRODUCED NO DATA"
            elif "error" in expected_data_text.lower() or "exception" in expected_data_text.lower():
                explanation = evaluation = "EXPECTED QUERY PRODUCED A SQL ERROR"
            elif "error" in data_text.lower() or "exception" in data_text.lower():
                explanation = evaluation = "GENERATED QUERY PRODUCED A SQL ERROR"
            else:
                print(f"CONTINUING TO DATA COMPARISON")
                subset, explanation = self._equalWithExtraColumns(expected_data_text, data_text)
                if subset: 
                    evaluation = "EXTRA COLUMNS"
                else:
                    evaluation = "MISMATCH"

            self._log(data_text_trimmed, "RESULT")
            self._log(expected_data_text_trimmed, "EXPECTED RESULT")

                
            self._log(explanation, "EXPLANATION")
            self._log(evaluation, "EVALUATION")

            if evaluation not in stats:
                stats[evaluation] = 0
            stats[evaluation] += 1

            stats_text = f"\n\n################################################\nCOMPLETED {question_count} TESTS. STATS SO FAR:\n"
            for stat, stat_count in stats.items():
                percent = int(round((100 * stat_count / (question_count)), 0))
                stats_text += f"{stat}: {stat_count} ({percent}%)\n"
            if evaluation in stats_summary_types:
                stats_summary[stats_summary_types[evaluation]] += 1
            stats_text += f"################################################\n{stats_summary}\n################################################\n"
            self._log(stats_text)
        return stats_text


if __name__ == "__main__":
    tester = SQLTester(database_name="northwind")
    stats = tester.run_tests(start_with=0, run_up_to=1, run_only_group=None)
    print(f"FINAL STATS: {stats}")
