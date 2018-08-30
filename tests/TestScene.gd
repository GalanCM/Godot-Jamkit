extends PanelContainer

func _input(event: InputEvent) -> void:
	if event is InputEventKey and ( event as InputEventKey ).scancode == KEY_1 and not event.is_echo() and event.is_pressed():
		add_child( load("res://tests/TestGameOver.tscn").instance() )
		set_process_input(false)
	elif event is InputEventKey and ( event as InputEventKey ).scancode == KEY_2 and not event.is_echo() and event.is_pressed():
		get_tree().change_scene_to( load("res://tests/TestGameOver2.tscn") )
		set_process_input(false)