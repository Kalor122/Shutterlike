extends Weapon

const DEFAULT_BULLET = preload("uid://c80avvvpjl4u5")
@onready var exit: Marker2D = $Exit

func _on_timer_timeout() -> void:
	_shoot(DEFAULT_BULLET, exit, data.damage)

func _round_start():
	player.speed += 999
	player.acceleration += 999

func _enemy_killed(who):
	print(who, 1)
