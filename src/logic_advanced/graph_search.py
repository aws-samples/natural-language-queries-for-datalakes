import ast
import heapq
from collections import deque
from queue import PriorityQueue
from config import dgConfig
from pyvis.network import Network
from pyvis.options import Configure

class GraphPathFinder():
	
	def __init__(self, database_name):
		# Database name should be something.db
		with open(f"{dgConfig.DATA_CATALOG_ADVANCED_DIR}/graphs/{database_name}.dict") as f:
			data = f.read()
			# print("Data type before reconstruction : ", type(data)) 
			# reconstructing the data as a dictionary 
			self.graph = ast.literal_eval(data)
			self.original_graph = ast.literal_eval(data)
		self.requiredNodes=set()
		self.bestPathNodes=set()
		self.prunedNodes=set()


	def _fillMissingEdges(self):
		for node, edges in self.graph.items():
			for edge in edges:
				backlinkEdges = self.graph[edge]
				if node not in backlinkEdges:
					backlinkEdges[node] = 1
					print(f"ADDING MISSING EDGE TO {node} ON BACKLINK NODE {edge}")


	def _weightedBfsFindPaths(self, start, requiredNodes):
		"""
		Perform a modified BFS using a priority queue to account for edge weights and find the shortest path
		containing all required nodes based on total edge weight.
		:param graph: Dictionary representing the adjacency list of the graph with weights.
		Each key is a node, each value is a list of tuples (neighbor, weight).
		:param start: The starting vertex.
		:param requiredNodes: A set of nodes that must all be included in the path.
		:return: The shortest path (by weight) that includes all required nodes.
		"""
		print("#### Looking for BestPath BETWEEN: ", requiredNodes)
		self.requiredNodes = requiredNodes
		requiredNodes = set(requiredNodes)
		# Priority queue: stores tuples (current total weight, current node, path taken, nodes visited)
		minHeap = [(0, start, [start], set([start]))]
		bestPath = None
		bestWeight = float('inf')
		# bestWeight = 1
		count = 0
		while minHeap and count < 10:
			count += 1
			currentWeight, current, path, visited = heapq.heappop(minHeap)

			# Check if this path has visited all required nodes
			if requiredNodes <= visited: # requiredNodes is a subset of visited
				if currentWeight < bestWeight:
					bestPath = path
					bestWeight = currentWeight
				# Since we found a valid path, we can stop here if no need to find all such paths
				break
			# Continue BFS from current node, considering the edge weights
			for neighbor, weight in self.graph[current]:
				if neighbor not in visited or requiredNodes > (visited | {neighbor}):
					# Compute new weight
					newWeight = currentWeight + weight
					# Add to the priority queue with updated path and visited set
					heapq.heappush(minHeap, (newWeight, neighbor, path + [neighbor], visited | {neighbor}))
					print("#### minHeap: ", minHeap)
		print("#### BestPath: ", bestPath)
		return bestPath, bestWeight


	def _find_paths(self, required_nodes, returnFirstValidPath=False):
		self.requiredNodes = required_nodes
		valid_paths = []
		shortest_path = None
		shortest_path_length = None
		queue = deque()
		for node in required_nodes:
			queue.append(([node], 0))
		print(f"\nFIND_PATHS: INITIALIZED QUEUE TO {queue}\n")

		count = 0
		while queue:
			count += 1
			(path, total_length) = queue.popleft()
			# print(f"  WHILE: PROCESSING PATH: {path}; TOTAL LENGTH: {total_length}; CURRENT VALID PATHS: {valid_paths}; SHORTEST PATH: {shortest_path}; SHORTES LENGTH: {shortest_path_length};")
			if count-1 % 100 == 0:
				print(f"WHILE: PROCESSING PATH number {count}: {path};")
			# print(f"	PATH NODE CHECK: CHECKING PATH: {path}; REQUIRED NODES: {required_nodes};")
			path_contains_all_required_nodes = True
			for node in required_nodes:
				# print(f"	  PATH NODE CHECK: CHECKING NODE: {node};")
				if node not in path:
					# print(f"		PATH NODE CHECK: NODE: {node} NOT IN PATH {path}. EXITING")
					path_contains_all_required_nodes = False
					break
			# if path_contains_all_required_nodes: print(f"	PATH NODE CHECK: FOUND ALL NODES!")
			if path_contains_all_required_nodes:
				print(f"	FOUND A VALID PATH! {path}")
				if returnFirstValidPath:
					return [(path, total_length)], path
				
				print(f"	IF PATH HAS ALL REQUIRED NODES: APPEND PATH AND WEIGHT TO PATHS AND CONTINUE")
				valid_paths.append((path, total_length))
				if not shortest_path_length or total_length < shortest_path_length:
					# print(f"	NEW SHORTEST PATH FOUND!")
					shortest_path = path
					shortest_path_length = total_length
					# for (valid_path, valid_path_length) in valid_paths: # remove paths that are longer than the shortest path
					#	 if valid_path_length > shortest_path_length:
					#		 valid_paths.remove((valid_path, valid_path_length))

			for node in path:
				# print(f"	FOR NODE: {node}")
				for neighbor, length in self.graph[node].items():
					# print(f"	FOR NEIGHBOR: {neighbor}; LENGTH: {length}")
					if neighbor in path:
						pass
						# print(f"	  IF NEIGHBOR: {neighbor} ALREADY IN PATH: {path}: do nothing")
					else:
						# print(f"	  IF NEIGHBOR: {neighbor} NOT IN PATH: {path}: APPEND NEIGHBOR TO PATH, ADD WEIGHT; REMOVE REMAINING REQUIRED IF IT'S ONE; ADD TO QUEUE")
						new_path = path + [neighbor]
						new_length = total_length + length
						if shortest_path_length is None or new_length <= shortest_path_length:
							queue.append((new_path, new_length))
							# print(f"	  NEW QUEUE: {queue}")
						else:
							# print(f"	  QUEUE NOT APPENDED: PATH ALREADY LONGER THAN THE SHORTEST KNOWN PATH")
							pass
		print(f"\n##### RETURNING SHORTEST PATH: {shortest_path}\nVALID PATHS: {valid_paths}\n")
		return valid_paths, shortest_path


	def _find_first_path_priority_queue(self, required_nodes):
		self.requiredNodes = required_nodes
		priority_queue = PriorityQueue()
		required_nodes_set = set(required_nodes)

		# Initialize priority queue with starting nodes
		for node in required_nodes:
			priority_queue.put((0, [node]))  # (priority, path)

		# print(f"\nFIND_PATHS: INITIALIZED PRIORITY QUEUE to {list(priority_queue)}\n")

		count = 0
		while not priority_queue.empty():
			count += 1
			queue_priority, path = priority_queue.get()
			current_node = path[-1]
			path_set = set(path)

			# print(f"WHILE: PROCESSING PATH number {count}: PRIORITY: {queue_priority}; PATH: {path}")

			if required_nodes_set <= path_set:
				print(f"	FOUND A VALID PATH! {path}")
				return path

			new_path = path
			# Immediately add any neighboring required nodes
			for neighbor in self.graph[current_node]:
				if neighbor in required_nodes_set and neighbor not in new_path:
					new_path = new_path + [neighbor]

			# Explore neighbors
			for neighbor in self.graph[current_node]:
				if neighbor not in path:
					new_path = new_path + [neighbor]
					# Calculate priority: higher ratio of required nodes to path length is better
					required_nodes_in_path = set(required_nodes_set).intersection(path_set)
					# print("required_nodes_in_path", required_nodes_in_path)
					priority = -len(required_nodes_in_path) / len(new_path)
					# print("priority", priority)

					priority_queue.put((priority, new_path))

		print(f"\n##### NO VALID PATH FOUND\n")
		return None


	def _find_shortest_path_list_priority_queue(self, required_nodes):
		self.requiredNodes = required_nodes
		priority_queue = PriorityQueue()
		required_nodes_set = set(required_nodes)

		# Initialize priority queue with starting nodes
		for node in required_nodes:
			priority_queue.put((0, [node]))  # (priority, path)

		# print(f"\nFIND_PATHS: INITIALIZED PRIORITY QUEUE to {list(priority_queue)}\n")

		shortest_path_list = []
		shortest_path_length = 99999999
		count = 0
		while not priority_queue.empty():
			count += 1
			queue_priority, path = priority_queue.get()
			current_node = path[-1]
			path_set = set(path)

			# print(f"WHILE: PROCESSING PATH number {count}: PRIORITY: {queue_priority}; PATH: {path}")

			if required_nodes_set <= path_set:
				print(f"	FOUND A VALID PATH! {path}")
				if len(path) < shortest_path_length:
					shortest_path_list.append(path)
					shortest_path_length = len(path)
			elif len(path) >= shortest_path_length:
				print(f"	NOT EXPLORING PATHS LONGER THAN SHORTEST VALID PATH ({shortest_path_list[0]})!")
				continue
			else:
				new_path = path
				# Immediately add any neighboring required nodes
				for neighbor in self.graph[current_node]:
					if neighbor in required_nodes_set and neighbor not in new_path:
						new_path = new_path + [neighbor]

				# Explore neighbors
				for neighbor in self.graph[current_node]:
					if neighbor not in path:
						new_path = new_path + [neighbor]
						# Calculate priority: higher ratio of required nodes to path length is better
						required_nodes_in_path = set(required_nodes_set).intersection(path_set)
						# print("required_nodes_in_path", required_nodes_in_path)
						priority = -len(required_nodes_in_path) / len(new_path)
						# print("priority", priority)

						priority_queue.put((priority, new_path))

		if not shortest_path_list:
			print(f"\n##### NO VALID PATH FOUND\n")
		else:
			print(f"\n##### RETURNING SHORTEST PATH: {shortest_path_list}\n")
			for shortest_path in shortest_path_list:
				self.bestPathNodes.update(set(shortest_path))

		return shortest_path_list


	def _pruneUnneededGraphLeaves(self, requiredNodeNames):
		self.requiredNodes = requiredNodeNames
		pruneList = ['PLACEHOLDER_NODE_TO_START_WHILE_LOOP']
		requiredNodeNames = set(requiredNodeNames)
		while pruneList:
			pruneList = set()
			for nodeName, edges in self.graph.items():
				# print(f"\n#### PRUNE EXAMINING NODE: {nodeName}, EDGES: {edges}\n")

				if nodeName in requiredNodeNames or nodeName in pruneList:
					continue

				# if the node has zero edges, it's an orphan, so can't lead to a required node
				# if the node has one edge and is not required then, it can't lead from one required node to another required node 
				if len(edges)<=1:
					pruneList.add(nodeName)
					self.prunedNodes.add(nodeName)
					print("Found leaf to prune", nodeName)
					continue

				# If a node is not required, and has the same neighbors as another node, it is redundant and can be deleted
				for otherNodeName, otherNodeEdges in self.graph.items():
					if otherNodeName == nodeName or otherNodeName in pruneList:
						continue
					# print(f"\tEXAMINING OTHER NODE {otherNodeName} VS {nodeName}")
					mySet = edges - {otherNodeName}
					otherNodeSet = otherNodeEdges - {nodeName}
					# print(f"\t\t{mySet} == {otherNodeSet}")
					#		 if node’s edges minus neighbor = neighbor’s edges minus node, delete node:
					if mySet == otherNodeSet:
						pruneList.add(nodeName)
						self.prunedNodes.add(nodeName)
						print(f"Found a redundant node to prune: {nodeName} has the same neighbors as {otherNodeName}")
						break

			print("\nPruning leaves: ", pruneList)
			for nodeName in pruneList:
				# delete node and remove it from its neighbors' edge lists
				edges = self.graph[nodeName]
				for edge in edges:
					backLinkNode = self.graph[edge]
					backLinkNode.remove(nodeName)
				self.graph.pop(nodeName)
		print(f"\nNEW PRUNED GRAPH: {self.graph}\n")


	def _pruneUnneededGraphLeaves_OLD(self, requiredNodeNames):
		leavesPruned = 99
		while leavesPruned > 0:
			leavesPruned = 0
			pruneList = []
			for nodeName, edges in self.graph.items():
				# print(f"\n#### PRUNE EXAMINING NODE: {nodeName}, EDGES: {edges}\n")
				if nodeName not in requiredNodeNames and len(edges)<=1:
					
					# handle orphan nodes such as us_states
					if len(edges) == 0:
						print("Found orphan node to prune", nodeName)
						self.graph.pop(nodeName)
						self.prunedNodes.add(nodeName)
						break
					
					# get first (and only) key from edges maps
					backLinkNodeName = list(edges)[0]
					backLinkNode = self.graph[backLinkNodeName]

					# remove nodeName key from backLinkNode map
					backLinkNode.remove(nodeName)

					leavesPruned += 1
					pruneList.append(nodeName)
					self.prunedNodes.add(nodeName)
					print("Found leaf to prune", nodeName)
			print("\nPruned leaves: ", pruneList)
			for nodeName in pruneList:
				del self.graph[nodeName]
			print(f"\nNEW PRUNED GRAPH: {self.graph}\n")


	def _listGraphEdges(self, node_name_list):
		node_name_list = set(node_name_list)
		ret = []
		for nodeName, edges in self.graph.items():
			if nodeName in node_name_list:
				ret.append({nodeName: edges})
		return ret


	def findValidPath(self, requiredNodes):
		start = requiredNodes[0]
		print("Rquired Nodes:", requiredNodes)
		self._fillMissingEdges()
		print("Graph before pruning:", self.graph)
		self._pruneUnneededGraphLeaves(requiredNodes)
		print("Graph after pruning:", self.graph)
		# shortest_path, total_weight = self._weightedBfsFindPaths(start, requiredNodes)
		# valid_paths, shortest_path = self._find_paths(requiredNodes, returnFirstValidPath=True)
		# print("ShortestPath: ", shortest_path)
		first_valid_path = self._find_first_path_priority_queue(requiredNodes)
		print("FirstValidPath: ", first_valid_path)
		return first_valid_path


	def findShortestPathList(self, requiredNodes):
		start = requiredNodes[0]
		print("Rquired Nodes:", requiredNodes)
		self._fillMissingEdges()
		print("Graph before pruning:", self.graph)
		self._pruneUnneededGraphLeaves(requiredNodes)
		print("Graph after pruning:", self.graph)
		# shortest_path, total_weight = self._weightedBfsFindPaths(start, requiredNodes)
		# valid_paths, shortest_path = self._find_paths(requiredNodes, returnFirstValidPath=True)
		# print("ShortestPath: ", shortest_path)
		shortest_valid_path_list = self._find_shortest_path_list_priority_queue(requiredNodes)
		for shortest_valid_path in shortest_valid_path_list:
			print("One Possible ShortestValidPath: ", shortest_valid_path)
		return shortest_valid_path_list, self.bestPathNodes


	def graphToHtml(self, html_file_name, width="500px", height="500px", requiredNodes=[], prunedNodes=[]):
		if requiredNodes == []:
			requiredNodes = self.requiredNodes
		if prunedNodes == []:
			prunedNodes = self.prunedNodes
		bestPathNodes = self.bestPathNodes
		graphNetwork = Network(notebook=True, filter_menu=False, cdn_resources="in_line", height=height, width=width) #width="100%"
		graphNetwork.options.configure = Configure(enabled=False, filter_=['nodes'])
		graphNetwork.set_options('var options = {"layout": {"randomSeed": 42}}')

		print("X"*100)
		print(f"RENDERING GRAPH {self.original_graph}")
		print(f"REQUIRED NODES: {requiredNodes}")
		print(f"PRUNED NODES: {prunedNodes}")
		print(f"BEST PATH NODES: {bestPathNodes}")
		print("X"*100)

		for node, edges in self.original_graph.items():
			flyover_text = f"this \n is \n {node}"
			
			COLOR_BRIGHT_BLUE = "#33ccff"
			COLOE_MEDIUM_BLUE = "#b3e0ff"
			COLOR_DARK_BLUE = "#0000cc"
			COLOR_LIGHT_BLUE = "#ccffff"
			COLOR_LIGHT_GREEN = "#e6ffe6"
			COLOR_MEDIUM_GREEN = "#00ff00"
			COLOR_LIGHT_RED = "#ffe6e6"
			COLOR_MEDIUM_RED = "#ff6666"
			COLOR_DARK_RED = "#ff0000"
			COLOR_WHITE = "#ffffff"

			bordercolor = COLOE_MEDIUM_BLUE
			fillcolor = COLOR_LIGHT_BLUE
			borderwidth = 2

			if node in prunedNodes:
				fillcolor = COLOR_LIGHT_RED
				bordercolor = COLOR_MEDIUM_RED

			if node in bestPathNodes:
				fillcolor = COLOE_MEDIUM_BLUE
				bordercolor = COLOR_DARK_BLUE
				borderwidth = 3

			if node in requiredNodes:
				fillcolor = COLOR_LIGHT_GREEN
				bordercolor = COLOR_MEDIUM_GREEN
				borderwidth = 3

			graphNetwork.add_node(node, label=node, color={'border': bordercolor, 'background': fillcolor}, borderWidth=borderwidth, title=flyover_text,  directed=True, shape="box")
			print(f"ADDED NODE: {node}")

		for node, edges in self.original_graph.items():
			print(f"NODE: {node}, EDGES: {edges}")
			for neighbor in edges:
				graphNetwork.add_edge(node, neighbor)
				graphNetwork.add_edge(neighbor, node)
				print(f"ADDED EDGE: {node} -> {neighbor} and {neighbor} -> {node}")

		# print(graphNetwork.get_nodes())
		graphNetwork.show(html_file_name)
		return graphNetwork
