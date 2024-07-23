import json
import os
import datetime
from sqlalchemy import create_engine
from langchain.sql_database import SQLDatabase
import json
import ast

log_file_name = None

def log(text, tag=None):
    global log_file_name
    log_text = ""
    if tag:
        log_text = f"\n<{tag}>\n{text}\n</{tag}>\n"
    else:
        log_text = f"{text}\n"

    print(log_text)
    with open(log_file_name, "a") as logfile:
            logfile.write(log_text)


def runQuery(database_name, query, type):
    if not query:
        return "ERROR: No query provided"
    db_name = f"{database_name}.db"
    dir = f"{current_working_directory}/src/example_data/datalake/data"
    sqllite_url = f"sqlite:///{dir}/{db_name}"
    engine_sqlite = create_engine(sqllite_url)
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

def equalWithExtraColumns(expected, generated):
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


def main(database_name, question_groups, start_with=0, run_up_to=None, run_only_group=None):
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
    for question_group in question_groups:
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

        log_header = f"\n\n################################################\n############# QUESTION {question_count} of {len(question_groups)} (SUBQUESTION {subquestion_no}, QUESTION {group_question_count}): {question}\n\nSQL:\n"
        log(log_header)

        # disambiguated_question, intent, required_tables = runIntentAndDisambiguation(question, conversation_history_string, tables, jargon)
        disambiguated_question, intent, required_tables = None, None, None

        log(intent, "INTENT")
        log(disambiguated_question, "DISAMBIGUATED QUESTION")
        log(required_tables, "REQUIRED TABLES")

        explanation = evaluation = "NOT SQL"

        # thinking, query = generateSQL(disambiguated_question, ddl_dict, ddl_general_commment, jargon, required_tables)
        thinking, query = None, expected_sql

        log(thinking, "THINKING")
        log(query, "QUERY")
        log(expected_sql, "EXPECTED SQL")
        log(expected_disambiguated_question, "EXPECTED DISAMBIGUATED QUESTION")

        data_text = runQuery(database_name, query, "GENERATED")
        data_text = str(data_text).strip()
        data_text_trimmed = "FIRST 10 ROWS:\n" + "\n".join(data_text.split("\n")[:10]) 

        expected_data_text = runQuery(database_name, expected_sql, "EXPECTED")
        expected_data_text = str(expected_data_text).strip()
        expected_data_text_trimmed = "FIRST 10 ROWS:\n" + "\n".join(expected_data_text.split("\n")[:10])

        conversation_history.append(f"user: {question}")
        conversation_history.append(f"assistant:\n<QUERY:>\n{query}\n</QUERY>\n<RESULT>\n{data_text}\n<RESULT>\n")

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
            subset, explanation = equalWithExtraColumns(expected_data_text, data_text)
            if subset: 
                evaluation = "EXTRA COLUMNS"
            else:
                evaluation = "MISMATCH"

        log(data_text_trimmed, "RESULT")
        log(expected_data_text_trimmed, "EXPECTED RESULT")

            
        log(explanation, "EXPLANATION")
        log(evaluation, "EVALUATION")

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
        log(stats_text)


if __name__ == "__main__":

    database_name = "mysports"

    current_working_directory = os.getcwd()
    print(f"CURRENT WORKING DIRECTORY: {current_working_directory}")
    python_script_name = os.path.basename(__file__)
    log_file_name = f"{current_working_directory}/src/tests/test_sql_answers_{database_name}.txt"
    time_now = datetime.datetime.now().strftime("%I:%M%p on %B %d, %Y")
    with open(log_file_name, "w") as logfile:
        logfile.write(f"SQL TEST: {time_now}")


    question_groups = []
    with open(f'{current_working_directory}/src/tests/{database_name}_tests.json') as f:
        question_groups = json.load(f)

    print(f"RUNNING {question_groups}")

    main(database_name, question_groups, start_with=0, run_up_to=None, run_only_group=None)
