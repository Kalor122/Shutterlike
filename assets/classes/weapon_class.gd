extends Node2D
class_name Weapon

@export var data: WeaponData

var damage: BigNumber = BigNumber.new()
var fire_rate: float

var player: PlayerEntity

func _ready() -> void:
	damage.exponent = 0
	damage.mantissa = 0
	damage.plus_equals(Globals.get_percentage(data.damage, PlayerStats.damage_percent))
	fire_rate = Globals.get_percentage(data.fire_rate, PlayerStats.attack_speed_percent)
	player = get_tree().current_scene.player
	GlobalSignals.enemy_spawned.connect(_enemy_spawned)
	GlobalSignals.enemy_killed.connect(_enemy_killed)
	GlobalSignals.enemy_hit.connect(_enemy_hit)
	GlobalSignals.round_start.connect(_round_start)
	GlobalSignals.round_end.connect(_round_end)
	_start()

func _process(delta: float) -> void:
	_update(delta)

func _physics_process(delta: float) -> void:
	_physics_update(delta)

func _shoot(bullet: PackedScene, exit: Node2D, damage: BigNumber):
	var instance = bullet.instantiate()
	if instance is BulletEntity:
		instance.global_position = exit.global_position
		instance.global_rotation = exit.global_rotation
		instance.direction = instance.direction.rotated(exit.global_rotation)
		instance.parent = self
		get_tree().current_scene.add_child(instance)
		instance.damage.exponent = 0
		instance.damage.mantissa = 0
		instance.damage.plus_equals(damage)

func _start():
	pass

func _update(delta: float):
	pass

func _physics_update(delta: float):
	pass

func _enemy_spawned(who: EnemyEntity):
	pass

func _enemy_killed(who: EnemyEntity):
	pass

func _enemy_hit(who: EnemyEntity, parent: Node2D):
	pass

func _round_start():
	pass

func _round_end():
	pass
