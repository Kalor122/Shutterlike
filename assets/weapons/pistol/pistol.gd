extends Weapon

const DEFAULT_BULLET = preload("uid://c80avvvpjl4u5")
@onready var exit: Marker2D = $Exit
@onready var timer: Timer = $Timer

func _start():
	timer.start(fire_rate)

func _on_timer_timeout() -> void:
	_shoot(DEFAULT_BULLET, exit, damage)
	timer.start(fire_rate)
