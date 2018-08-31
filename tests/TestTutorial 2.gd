extends ProgressBar

signal next_tutorial

func _ready() -> void:
	hide()

func _process(delta: float) -> void:
	value = $Timer.wait_time - $Timer.time_left
	
func start_tutorial() -> void:
	show()
	$Timer.start()
	
	yield($Timer, "timeout")
	emit_signal("next_tutorial")