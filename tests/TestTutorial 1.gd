extends Label

signal next_tutorial

func _ready() -> void:
	hide()
	set_process_input(false)

func start_tutorial() -> void:
	show()
	( $AnimationPlayer as AnimationPlayer ).play("Intro")
	
	yield($AnimationPlayer, "animation_finished")
	set_process_input(true)
	
func _input(event: InputEvent) -> void:
	if event is InputEventKey and ( event as InputEventKey ).scancode == KEY_Z and event.is_pressed() and not event.is_echo():
		( $AnimationPlayer as AnimationPlayer ).play("Outro")
		
		yield($AnimationPlayer, "animation_finished")
		emit_signal("next_tutorial")
	