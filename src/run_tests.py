print("TESTER STARTING")

################### ENVIRONMENT SMOKE TESTS ###################
import sys
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

databases_to_test = ["northwind"]
# databases_to_test = ["northwind", "mysports"]
# databases_to_test = ["Chinook", "northwind", "mysports"]

final_stats = {}
for database_name in databases_to_test:
	tester = SQLTester(database_name=database_name)
	stats = tester.run_tests(start_with=1, run_up_to=None, run_only_group=None)
	final_stats[database_name]=stats

print(f"\n\n##############################\nFINAL STATS:")
for database_name, stats in final_stats.items():
	print(f"\nTESTS FOR {database_name}:\n{stats}")

print("TESTER DONE")
