extends Node

signal tutorial_complete

func _ready() -> void:
	# loop through each direct child
	for child in get_children():
		var tutorial := child as Node
		
		# Warn if child node is missing either a `start_tutorial` method or a `next_tutorial` signal
		assert( tutorial.has_method("start_tutorial") )
		assert( tutorial.has_user_signal("next_tutorial") or ( tutorial.get_script() as Script ).has_script_signal("next_tutorial") )

		# activate the tutorial
		tutorial.start_tutorial()
		
		# wait for this tutorial to complete before going to the next one
		yield(tutorial, "next_tutorial")
	
	emit_signal("tutorial_complete")
	
	# free JamTutorial when done
	queue_free()