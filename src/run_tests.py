print("TESTER STARTING! PARAMS: python3 run_tests.py [DATABASE_NAME [QUESTION_NUMBER]]")

################### ENVIRONMENT SMOKE TESTS ###################
import sys
import os
if not os.getcwd().endswith("src"):
	assert "ERROR" == "YOU MUST RUN FROM THE 'src' DIRCTORY"
################### ENVIRONMENT SMOKE TESTS DONE ###################

databases_param = sys.argv[1] if len(sys.argv) >= 2 else None
run_only_test_param = sys.argv[2] if len(sys.argv) >= 3 else None

from config import dgConfig
from tests.sql_tester import SQLTester

################### BEDROCK SMOKE TESTS ###################
try:
	from utils.llm import LanguageModel
	def callback(completion):
		pass
	generated_text = LanguageModel().invoke_with_stream_callback("anthropic.claude-3-sonnet-20240229-v1:0", "Why is the sky blue?", callback, system_prompt="You are a pirate. Speak only as a pirate.")
except Exception as e:
	assert "ERROR" == f"ERROR: {e} WHEN CALLING LLM\nDO YOU HAVE AWS CREDENTIALS SET IN THIS SHELL?"
################### BEDROCK SMOKE TESTS DONE ###################


# find all files containing test configurations for each database (in the src/tests/test_sets directory) and extract the database name (e.g.: "Chinook") from the file name (<database>_tests.json), so we can test each dtabase for which we have tests defined
databases_to_test = [databases_param] if databases_param else [file.replace("_tests.json", "") for file in os.listdir(dgConfig.TEST_QUESTIONS_DIR)]

final_stats = {}
for database_name in databases_to_test:
	tester = SQLTester(database_name=database_name)
	if run_only_test_param:
		run_only_test = int(run_only_test_param)
		stats = tester.run_tests(start_with=run_only_test, run_up_to=run_only_test, run_only_group=None)
	else:
		stats = tester.run_tests(start_with=1, run_up_to=None, run_only_group=None)
	final_stats[database_name]=stats

print(f"\n\n##############################\nFINAL STATS:")
for database_name, stats in final_stats.items():
	print(f"\nTESTS FOR {database_name}:\n{stats}")

print("TESTER DONE")
