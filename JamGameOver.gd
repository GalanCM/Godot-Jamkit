extends TextureRect
class_name JamGameOver

enum RestartModes {
	current_scene,
	target_scene
}

export(RestartModes) var restart_mode = RestartModes.current_scene
export var restart_target: PackedScene

func _ready() -> void:
	# wait for animation to complete before accepting input
	set_process_input(false)
	
	# pause any background scenes
	get_tree().paused = true

func _input(event: InputEvent) -> void:
	# quit game input (ESC)
	if event is InputEventKey and (event as InputEventKey).scancode == KEY_ESCAPE and event.is_pressed() and not event.is_echo():
		get_tree().quit()
	
	# restart game input (any key or action but ESC)
	elif ( event is InputEventKey or event is InputEventAction ) and not event.is_echo():
		if restart_mode == RestartModes.target_scene:
			if restart_target != null:
				get_tree().change_scene_to(restart_target)
			else:
				printerr("JamGameOver: must provide target scene when 'Restart Scene' is set to 'Target''")
		else:
			get_tree().reload_current_scene()
		
		# unpause background scenes
		get_tree().paused = false
