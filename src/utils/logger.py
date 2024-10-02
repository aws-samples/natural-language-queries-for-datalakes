import os
import datetime
from config import dgConfig
import pandas as pd
import json

LOG_FILE_PREFIX=None
LOG_FILE_NAME=None

class Logger():
	# The logger can be started with or without a prefix.
	# If the logger was already initialized, and this method is called without a prefix value, it will retain the same prefix. 
	# Otherwise the supplied prefix value will be stored.
	# Any time the prefix value changes, the logger will start a new file (deleting any existing file contents with that name)
	def __init__(self, prefix=None):
		global LOG_FILE_PREFIX
		global LOG_FILE_NAME
		original_prefix = LOG_FILE_PREFIX

		if LOG_FILE_PREFIX is None:
			LOG_FILE_PREFIX = "default" # make sure we init the file even if the first init does not pass a prefix
		
		if prefix is not None:
			LOG_FILE_PREFIX = prefix # if a prefix is supplied, it wins

		date_time_str = datetime.datetime.now().strftime("%Y%m%d_%H%M%S")

		parameters = dgConfig().getParametersString()

		if original_prefix != LOG_FILE_PREFIX: # if the prefix changed, re-initialize the file

			# checking if the logs directory exists
			if not os.path.exists(dgConfig.LOG_FILE_DIR):
				# if the logs directory is not present then create it. 
				os.makedirs(dgConfig.LOG_FILE_DIR)

			LOG_FILE_NAME = f"{dgConfig.LOG_FILE_DIR}/{LOG_FILE_PREFIX}__{parameters}__{date_time_str}.log"
			with open(LOG_FILE_NAME, "w") as logfile:
				logfile.write(f"DATAGENIE LOG START: {datetime.datetime.now().strftime('%I:%M%p on %B %d, %Y')}")

		self.excel_filename = f"{dgConfig.LOG_FILE_DIR}/DATAGENIE_STATS.xlsx"
		if os.path.exists(self.excel_filename):
			self.df = pd.read_excel(self.excel_filename, engine='openpyxl')
		else:
			self.df = pd.DataFrame(columns=['database', 'parameters', 'time', 'question'])
		self.df.to_excel(self.excel_filename, index=False, engine='openpyxl')
		self.stats_database = LOG_FILE_PREFIX
		self.stats_parameters = parameters
		self.stats_time = date_time_str
		self.stats_question = None


	def setPrefix(self, prefix):
		self.__init__(prefix=prefix)


	def log(self, text, tag=None):
		global LOG_FILE_NAME
		log_text = ""
		if tag:
			log_text = f"\n<{tag}>\n{text}\n</{tag}>\n"
		else:
			log_text = f"{text}\n"

		print(log_text)
		with open(LOG_FILE_NAME, "a") as logfile:
				logfile.write(log_text)

		if self.stats_question and tag:
			self.log_stats(self.stats_database, self.stats_parameters, self.stats_time, self.stats_question, tag, text)


	def set_question_number(self, question_number):
		self.stats_question = question_number


	def log_stats(self, database, parameters, time, question, key, value):
		identifier = {'database': database, 'parameters': parameters, 'time': time, 'question': question}
		existing_row = self.df.loc[(self.df['database'] == database) & (self.df['parameters'] == parameters) & (self.df['time'] == time) & (self.df['question'] == question)]
		if type(value) is set:
			value = list(value)
			
		value = json.dumps(value)

		# print(f"Upserting {key}={value} for {identifier}")
		# print(f"Existing row: {existing_row}")

		if existing_row.empty:
			new_row = pd.DataFrame([identifier])
			new_row[key] = value
			self.df = pd.concat([self.df, new_row], ignore_index=True)
		else:
			row_index = existing_row.index[0]
			# print(f"Updating existing row at index {row_index}")
			self.df.at[row_index, key] = value

		if key not in self.df.columns:
			self.df[key] = pd.NA


	def save_stats(self):
		self.df.to_excel(self.excel_filename, index=False, engine='openpyxl')
		print(f"DataFrame saved to {self.excel_filename}")
