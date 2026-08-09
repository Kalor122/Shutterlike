extends Weapon

const ARROW = preload("uid://dskb664761jxw")
@onready var timer: Timer = $Timer
@onready var exit: Marker2D = $Exit

func _start():
	timer.start(fire_rate)

func _on_timer_timeout() -> void:
	_shoot(ARROW, exit, damage)
	timer.start(fire_rate)
