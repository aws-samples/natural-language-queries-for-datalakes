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


tester = SQLTester(database_name="Chinook")
stats = tester.run_tests(start_with=0, run_up_to=None, run_only_group=None)
print(f"FINAL STATS: {stats}")

print("TESTER DONE")
