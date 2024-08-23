import os
import datetime
from logic.config import dgConfig

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

		if original_prefix != LOG_FILE_PREFIX: # if the prefix changed, re-initialize the file

			# checking if the logs directory exists
			if not os.path.exists(dgConfig.LOG_FILE_DIR):
				# if the logs directory is not present then create it. 
				os.makedirs(dgConfig.LOG_FILE_DIR)

			LOG_FILE_NAME = f"{dgConfig.LOG_FILE_DIR}/{LOG_FILE_PREFIX}_{datetime.datetime.now().strftime('%Y%m%d_%H%M%S')}.log"
			with open(LOG_FILE_NAME, "w") as logfile:
				logfile.write(f"DATAGENIE LOG START: {datetime.datetime.now().strftime('%I:%M%p on %B %d, %Y')}")


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
