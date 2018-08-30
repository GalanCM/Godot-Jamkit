extends Node


func get_unique_node(id: String) -> Node:
	var group := get_tree().get_nodes_in_group(id)
	if len( group ) == 0:
		return null
	
	if len( group ) != 1:
		printerr("WARNING: Unique node `" + id + "` is being used by multiple nodes:")
		for node in group:
			printerr("  " + node.name)
	
	return group[0]