extends Weapon

const DEFAULT_BULLET = preload("uid://c80avvvpjl4u5")

@onready var marker_2d: Marker2D = $Marker2D
@onready var timer: Timer = $Timer

func _start():
	timer.start(fire_rate)

func _on_timer_timeout() -> void:
	marker_2d.position.y = randf_range(-2.6, 11.09)
	_shoot(DEFAULT_BULLET, marker_2d, damage)
	timer.start(fire_rate)
