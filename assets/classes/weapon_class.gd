extends Node2D
class_name Weapon

@export var data: WeaponData

var follow_mouse: bool = true

var damage: BigNumber = BigNumber.new()
var fire_rate: float

var damage_extra: BigNumber = BigNumber.new()
var fire_rate_extra: float

var player: PlayerEntity

func _ready() -> void:
	damage_extra.minus_equals(1)
	_recalculate_stats()
	player = get_tree().current_scene.player
	GlobalSignals.enemy_spawned.connect(_enemy_spawned)
	GlobalSignals.enemy_killed.connect(_enemy_killed)
	GlobalSignals.enemy_hit.connect(_enemy_hit)
	GlobalSignals.round_start.connect(_round_start)
	GlobalSignals.round_end.connect(_round_end)
	GlobalSignals.recalculate_stats.connect(_recalculate_stats)
	_start()

func _recalculate_stats():
	damage.exponent = 0
	damage.mantissa = 0
	damage.plus_equals(data.damage * PlayerStats.damage_multiplier)
	fire_rate = data.fire_rate - ((float(PlayerStats.attack_speed) ** 0.6) / 100)
	damage.plus_equals(damage_extra)
	fire_rate += fire_rate_extra
	print(damage.to_float(), " ", fire_rate)
	GlobalSignals.after_recalculate.emit()

func _process(delta: float) -> void:
	if fire_rate <= 0.01:
		fire_rate = 0.01
	
	if follow_mouse:
		look_at(get_global_mouse_position())
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

func add_damage(value: float):
	damage.plus_equals(value)
	damage_extra.plus_equals(value)

func sub_damage(value: float):
	damage.minus_equals(value)
	damage_extra.minus_equals(value)

func mult_damage(value: float):
	damage.multiply_equals(value)
	damage_extra.multiply_equals(value)

func div_damage(value: float):
	damage.divide_equals(value)
	damage_extra.divide_equals(value)

func pow_damage(value: float):
	damage.power_equals(value)
	damage_extra.power_equals(value)

func add_fire_rate(value: float):
	fire_rate += value
	fire_rate_extra += value

func sub_fire_rate(value: float):
	fire_rate -= value
	fire_rate_extra -= value

func mult_fire_rate(value: float):
	fire_rate *= value
	fire_rate_extra *= value

func div_fire_rate(value: float):
	fire_rate /= value
	fire_rate_extra /= value

func pow_fire_rate(value: float):
	fire_rate = fire_rate ** value
	fire_rate_extra = fire_rate_extra ** value

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

func _enemy_hit(who: EnemyEntity, parent: Node2D, damage: BigNumber):
	pass

func _round_start():
	pass

func _round_end():
	pass
