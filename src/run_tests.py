print("TESTER STARTING")

################### ENVIRONMENT SMOKE TESTS ###################
import os
cwd = os.getcwd()
if not cwd.endswith("src"):
	print("ERROR: YOU MUST RUN FROM THE 'src' DIRCTORY")
	assert False

try:
	from utils.llm import LanguageModel
	def callback(completion):
		pass
	generated_text = LanguageModel().invoke_with_stream_callback("Why is the sky blue?", callback)
except Exception as e:
	print(f"ERROR: {e} WHEN CALLING LLM\nDO YOU HAVE AWS CREDENTIALS SET IN THIS SHELL?")
	assert False
################### ENVIRONMENT SMOKE TESTS DONE ###################

from tests.sql_tester import SQLTester
from logic.config import dgConfig

# find all files containing test configurations for each database (in the src/tests/test_sets directory) and extract the database name (e.g.: "Chinook") from the file name (<database>_tests.json), so we can test each dtabase for which we have tests defined
databases_to_test = [file.replace("_tests.json", "") for file in os.listdir(dgConfig.TEST_QUESTIONS_DIR)]

final_stats = {}
for database_name in databases_to_test:
	tester = SQLTester(database_name=database_name)
	stats = tester.run_tests(start_with=1, run_up_to=None, run_only_group=None)
	final_stats[database_name]=stats

print(f"\n\n##############################\nFINAL STATS:")
for database_name, stats in final_stats.items():
	print(f"\nTESTS FOR {database_name}:\n{stats}")

print("TESTER DONE")
