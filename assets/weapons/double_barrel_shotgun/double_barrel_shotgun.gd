extends Weapon

const SHOTGUN_BULLET = preload("uid://bjc7xebagp5i")

@onready var marker_2d: Marker2D = $Marker2D
@onready var marker_2d_3: Marker2D = $Marker2D3
@onready var marker_2d_2: Marker2D = $Marker2D2
@onready var timer: Timer = $Timer

func _start():
	timer.start(fire_rate)

func _on_timer_timeout() -> void:
	_shoot(SHOTGUN_BULLET, marker_2d, damage)
	_shoot(SHOTGUN_BULLET, marker_2d_2, damage)
	_shoot(SHOTGUN_BULLET, marker_2d_3, damage)
	await get_tree().create_timer(0.2).timeout
	_shoot(SHOTGUN_BULLET, marker_2d, damage)
	_shoot(SHOTGUN_BULLET, marker_2d_2, damage)
	_shoot(SHOTGUN_BULLET, marker_2d_3, damage)
	timer.start(fire_rate)
