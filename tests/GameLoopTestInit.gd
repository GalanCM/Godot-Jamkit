extends Node

func _ready() -> void:
	get_node("/root/JamKit").add_child( GameLoopTest.new() )

class GameLoopTest extends Node:
	var loop_count = 0
	
	func _ready() -> void:
		name = "GameLoopTest"