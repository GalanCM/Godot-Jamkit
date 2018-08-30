extends Node

var __unique_nodes: Dictionary = {} setget __set__unique_nodes, __get__unique_nodes

func set_unique_node(id: String, node: Node, replace := false):
	assert( not (replace == false and id in __unique_nodes) ) # set `replace` parameter to replace unique node
	if replace == false and id in __unique_nodes:
		return
	
	__unique_nodes[id] = node

func get_unique_node(id: String) -> Node:
	if not id in __unique_nodes:
		return null
	if id in __unique_nodes and __unique_nodes[id] == null:
		__unique_nodes.erase(id)
		return null
	return __unique_nodes[id]

# Setget functions for __unique_nodes. Warn users when they try to access or manipulate it. 
func __set__unique_nodes(new__unique_nodes: Dictionary):
	printerr("JamKit: direct access to '__unique_nodes' is not recommended. Try using 'set_unique_node()' or 'replace_unique_node()' instead.")
	__unique_nodes = new__unique_nodes
func __get__unique_nodes():
	printerr("JamKit: direct access to '__unique_nodes' is not recommended. Try using 'get_unique_node()' instead.")
	return __unique_nodes