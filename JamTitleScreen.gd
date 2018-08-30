extends TextureRect

export var game_scene: PackedScene

func _ready() -> void:
	# wait for animation to complete before accepting input
	set_process_input(false)

func _input(event: InputEvent) -> void:
	if ( event is InputEventKey or event is InputEventAction ) and not event.is_echo():
		if game_scene != null:
			get_tree().change_scene_to(game_scene)
		else:
			printerr("JamTitleScreen: no Game Scene configured.")
