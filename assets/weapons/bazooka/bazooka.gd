extends Weapon

const BAZOOKA_BULLET = preload("uid://bdd2aw1tag8r6")

@onready var timer: Timer = $Timer
@onready var marker_2d: Marker2D = $Marker2D

func _start():
	timer.start(fire_rate)

func _on_timer_timeout() -> void:
	_shoot(BAZOOKA_BULLET, marker_2d, damage)
