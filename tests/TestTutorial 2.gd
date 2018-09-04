extends ProgressBar

signal next_tutorial

func _ready() -> void:
	hide()

func _process(_delta: float) -> void:
	var timer := ($Timer as Timer)
	value = timer.wait_time - timer.time_left
	
func start_tutorial() -> void:
	var timer := $Timer as Timer
	
	show()
	timer.start()
	
	yield(timer, "timeout")
	emit_signal("next_tutorial")