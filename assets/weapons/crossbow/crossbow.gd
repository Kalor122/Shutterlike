extends Weapon

const ARROW = preload("uid://dskb664761jxw")
@onready var timer: Timer = $Timer
@onready var exit: Marker2D = $Exit
@onready var exit_2: Marker2D = $Exit2
@onready var exit_3: Marker2D = $Exit3

func _start():
	timer.start(fire_rate)

func _on_timer_timeout() -> void:
	_shoot(ARROW, exit, damage)
	_shoot(ARROW, exit_2, damage)
	_shoot(ARROW, exit_3, damage)
	timer.start(fire_rate)
