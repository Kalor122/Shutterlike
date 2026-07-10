extends Weapon

const DEFAULT_BULLET = preload("uid://c80avvvpjl4u5")
@onready var exit: Marker2D = $Exit

func _on_timer_timeout() -> void:
	_shoot(DEFAULT_BULLET, exit, damage)

func _round_start():
	player.speed += 999
	player.acceleration += 999

func _enemy_killed(who: EnemyEntity):
	print(who, 1)

func _enemy_hit(who: EnemyEntity, parent: Node2D):
	if parent == self:
		damage += Globals.get_percentage(damage, 2)
		print(damage)
		print("Helath: ", who.health.to_float())
