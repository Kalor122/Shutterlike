extends Weapon

const DEFAULT_BULLET = preload("uid://c80avvvpjl4u5")

@onready var timer: Timer = $Timer
@onready var marker_2d: Marker2D = $Marker2D

func _start():
	timer.start(fire_rate)

func _on_timer_timeout() -> void:
	_shoot(DEFAULT_BULLET, marker_2d, damage)
	timer.start(fire_rate)
