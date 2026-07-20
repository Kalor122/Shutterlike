extends Node2D
class_name Weapon

@export var data: WeaponData

var damage: BigNumber = BigNumber.new()
var fire_rate: float

var damage_extra: BigNumber = BigNumber.new()
var fire_rate_extra: float

var player: PlayerEntity

func _ready() -> void:
	damage_extra.minus_equals(1)
	damage.exponent = 0
	damage.mantissa = 0
	damage.plus_equals(Globals.get_percentage(data.damage, 100 + PlayerStats.damage_percent.to_float()))
	fire_rate = Globals.get_percentage(data.fire_rate, 100 - PlayerStats.attack_speed_percent)
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
	damage.plus_equals(Globals.get_percentage(data.damage, 100 + PlayerStats.damage_percent.to_float()))
	fire_rate = Globals.get_percentage(data.fire_rate, 100 - PlayerStats.attack_speed_percent)
	damage.plus_equals(damage_extra)
	fire_rate += fire_rate_extra
	print(damage.to_float(), " ", fire_rate)
	GlobalSignals.after_recalculate.emit()

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

func _add_damage(value: float):
	damage.plus_equals(value)
	damage_extra.plus_equals(value)

func _sub_damage(value: float):
	damage.minus_equals(value)
	damage_extra.minus_equals(value)

func _mult_damage(value: float):
	damage.multiply_equals(value)
	damage_extra.multiply_equals(value)

func _div_damage(value: float):
	damage.divide_equals(value)
	damage_extra.divide_equals(value)

func _pow_damage(value: float):
	damage.power_equals(value)
	damage_extra.power_equals(value)

func _add_fire_rate(value: float):
	fire_rate += value
	fire_rate_extra += value

func _sub_fire_rate(value: float):
	fire_rate -= value
	fire_rate_extra -= value

func _mult_fire_rate(value: float):
	fire_rate *= value
	fire_rate_extra *= value

func _div_fire_rate(value: float):
	fire_rate /= value
	fire_rate_extra /= value

func _pow_fire_rate(value: float):
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
