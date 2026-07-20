extends Weapon

const DEFAULT_BULLET = preload("uid://c80avvvpjl4u5")
@onready var exit: Marker2D = $Exit
@onready var timer: Timer = $Timer

func _start():
	timer.start(fire_rate)

func _on_timer_timeout() -> void:
	_shoot(DEFAULT_BULLET, exit, damage)
	timer.start(fire_rate)

func _round_start():
	player.speed += 999
	player.acceleration += 999

func _enemy_killed(who: EnemyEntity):
	print(who, 1)

func _enemy_hit(who: EnemyEntity, parent: Node2D, damage: BigNumber):
	if parent == self:
		_mult_damage(999)
