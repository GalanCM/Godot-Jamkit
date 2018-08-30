extends TextureRect

enum RestartScenes {
	current,
	target
}

export(RestartScenes) var restart_scene = RestartScenes.current
export var target_scene: PackedScene

func _ready() -> void:
	# wait for animation to complete before accepting input
	set_process_input(false)
	
	# pause any background scenes
	get_tree().paused = true

func _input(event: InputEvent) -> void:
	if event is InputEventKey and (event as InputEventKey).scancode == KEY_ESCAPE and event.is_pressed() and not event.is_echo():
		get_tree().quit()
	elif ( event is InputEventKey or event is InputEventAction ) and not event.is_echo():
		if restart_scene != RestartScenes.target:
			if target_scene != null:
				get_tree().change_scene_to(target_scene)
			else:
				printerr("JamGameOver: must provide target scene when 'Restart Scene' is set to 'Target''")
		else:
			get_tree().reload_current_scene()
