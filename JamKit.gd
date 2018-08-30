extends Node

var _unique_nodes: Dictionary = {} setget set_unique_nodes, get_unique_nodes

func set_unique_node(id: String, node: Node, allow_replacing := false):
	if not allow_replacing and id in _unique_nodes:
		printerr("Unique node " + id + 
			" already exists. If you wish to allow this, try 'set_unique_node(" + 
			id + ", " + node.name + ", true)'")
		breakpoint
	
	_unique_nodes[id] = Node

func get_unique_node(id: String) -> Node:
	return _unique_nodes[id]

# Setget functions for _unique_nodes. Warn users when they try to access or manipulate it. 
func set_unique_nodes(new_unique_nodes: Dictionary):
	printerr("JamKit: direct access to '_unique_nodes' is not recommended. Try using 'set_unique_node()' or 'replace_unique_node()' instead.")
	_unique_nodes = new_unique_nodes
func get_unique_nodes():
	printerr("JamKit: direct access to '_unique_nodes' is not recommended. Try using 'get_unique_node()' instead.")
	return _unique_nodes