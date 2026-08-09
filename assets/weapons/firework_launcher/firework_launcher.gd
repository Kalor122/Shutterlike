extends Weapon

const FIREWORK_BULLET = preload("uid://beyxvivytsusw")

@onready var timer: Timer = $Timer
@onready var marker_2d: Marker2D = $Marker2D

func _start():
	timer.start(fire_rate)

func _on_timer_timeout() -> void:
	_shoot_firework()
	await get_tree().create_timer(0.1).timeout
	_shoot_firework()
	await get_tree().create_timer(0.1).timeout
	_shoot_firework()
	await get_tree().create_timer(0.1).timeout
	_shoot_firework()
	await get_tree().create_timer(0.1).timeout
	timer.start(fire_rate)

func _shoot_firework():
	marker_2d.rotation_degrees = randf_range(-7.0, 7.0)
	_shoot(FIREWORK_BULLET, marker_2d, damage)
