import ast
import heapq
from collections import deque
from queue import PriorityQueue
from logic.config import dgConfig

class GraphPathFinder():
	
	def __init__(self, database_name):
		# Database name should be something.db
		with open(f"{dgConfig.DATA_CATALOG_DIR}/graphs/{database_name}.dict") as f:
			data = f.read()
			# print("Data type before reconstruction : ", type(data)) 
			# reconstructing the data as a dictionary 
			self.graph = ast.literal_eval(data)

	def findValidPath(self, requiredNodes):
		return requiredNodes
