extends Node

func _ready() -> void:
	# loop through each direct child
	for child in get_children():
		var tutorial := child as Node
		
		# Warn if child node is missing either a `start_tutorial` method or a `next_tutorial` signal
		if not tutorial.has_method("start_tutorial"):
			printerr("Tutorial " + tutorial.name + " is missing required function 'start_step'." )
		if not tutorial.has_user_signal("next_tutorial") and not ( tutorial.get_script() as Script ).has_script_signal("next_tutorial"):
			printerr("Tutorial " + tutorial.name + " is missing required signal 'next_step'." )

		# activate the tutorial
		tutorial.start_tutorial()
		
		# wait for this tutorial to complete before going to the next one
		yield(tutorial, "next_tutorial")
	
	# free JamTutorial when done
	queue_free()