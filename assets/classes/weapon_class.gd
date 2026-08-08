extends Node2D
class_name Weapon

@export var data: WeaponData

var follow_mouse: bool = true

var damage: BigNumber = BigNumber.new()
var fire_rate: float

var damage_extra_sum: float = 0
var damage_extra_sub: float = 0
var damage_extra_mult: float = 1
var damage_extra_div: float = 1
var damage_extra_pow: float = 1

var fire_rate_extra_sum: float = 0
var fire_rate_extra_sub: float = 0
var fire_rate_extra_mult: float = 1
var fire_rate_extra_div: float = 1
var fire_rate_extra_pow: float = 1

var entity_effects: Array[EntityEffectData] = []

var player: PlayerEntity

func _ready() -> void:
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
	fire_rate = Globals.round_to_dec(data.fire_rate - (float(PlayerStats.attack_speed) / 1000), 3)
	damage.plus_equals(damage_extra_sum)
	damage.multiply_equals(damage_extra_mult)
	damage.power_equals(damage_extra_pow)
	if damage.is_less_than(damage_extra_sub):
		damage.exponent = 0
		damage.mantissa = 1
	else:
		damage.minus_equals(damage_extra_sub)
	damage.divide_equals(damage_extra_div)
	fire_rate += fire_rate_extra_sum
	fire_rate *= fire_rate_extra_mult
	fire_rate **= fire_rate_extra_pow
	fire_rate -= fire_rate_extra_sub
	fire_rate /= fire_rate_extra_div
	#print(damage.to_float(), " ", fire_rate)
	GlobalSignals.after_recalculate.emit()

func _process(delta: float) -> void:
	if fire_rate <= 0.01:
		fire_rate = 0.01
	
	if damage.is_less_than(1):
		damage.exponent = 0
		damage.mantissa = 1
	
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
		instance.entity_effects = entity_effects

func add_damage(value: float):
	damage_extra_sum += value
	GlobalSignals.recalculate_stats.emit()

func sub_damage(value: float):
	damage_extra_sub += value
	GlobalSignals.recalculate_stats.emit()

func mult_damage(value: float):
	damage_extra_mult += value
	GlobalSignals.recalculate_stats.emit()

func div_damage(value: float):
	damage_extra_div += value
	GlobalSignals.recalculate_stats.emit()

func pow_damage(value: float):
	damage_extra_pow += value
	GlobalSignals.recalculate_stats.emit()

func add_fire_rate(value: float):
	fire_rate_extra_sum += value
	GlobalSignals.recalculate_stats.emit()

func sub_fire_rate(value: float):
	fire_rate_extra_sub += value
	GlobalSignals.recalculate_stats.emit()

func mult_fire_rate(value: float):
	fire_rate_extra_mult += value
	GlobalSignals.recalculate_stats.emit()

func div_fire_rate(value: float):
	fire_rate_extra_div += value
	GlobalSignals.recalculate_stats.emit()

func pow_fire_rate(value: float):
	fire_rate_extra_pow += value
	GlobalSignals.recalculate_stats.emit()

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
