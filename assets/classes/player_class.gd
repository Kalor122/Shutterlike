extends Entity
class_name PlayerEntity

@export var data: PlayerData
@export var sprite: AnimatedSprite2D
@export var gun_positions: Node2D

var held_weapons: Array[Weapon] = [
	null,
	null,
	null,
	null,
	null,
	null,
	null,
	null,
	]

var direction_x = 1
var direction_y = 1

var speed: float
var acceleration: float
var health: BigNumber = BigNumber.new()

func _ready():
	GlobalSignals.enemy_spawned.connect(_enemy_spawned)
	GlobalSignals.enemy_killed.connect(_enemy_killed)
	GlobalSignals.enemy_hit.connect(_enemy_hit)
	GlobalSignals.entity_damaged.connect(_entity_damaged)
	GlobalSignals.round_start.connect(_round_start)
	GlobalSignals.round_end.connect(_round_end)
	GlobalSignals.time_passed.connect(_time_passed)
	GlobalSignals.player_take_damage.connect(_player_take_damage)
	health.exponent = 0
	health.mantissa = 0
	speed = data.speed * (1 + (float(PlayerStats.speed) / 100))
	health.plus_equals(PlayerStats.health)
	_create_weapons()
	_create_items()
	GlobalSignals.recalculate_stats.emit()
	GlobalSignals.round_start.emit()
	_start()

func _physics_process(delta: float) -> void:
	if speed <= 10.0:
		speed = 10.0
	
	direction_x = Input.get_axis("left", "right")
	direction_y = Input.get_axis("up", "down")
	
	if direction_x != 0:
		velocity.x = speed * direction_x
	else:
		velocity.x = 0
	
	if direction_y != 0:
		velocity.y = speed * direction_y
	else:
		velocity.y = 0
	
	if health.is_less_than(1):
		GlobalSignals.game_over.emit()
	
	_update_animation()
	move_and_slide()
	_physics_update(delta)

func _process(delta: float) -> void:
	_update(delta)

func _update_animation():
	if direction_x == 1:
		sprite.flip_h = false
	if direction_x == -1:
		sprite.flip_h = true

func _create_weapons():
	if Globals.bought_weapons[0] != null:
		gun_positions._1.add_child(load(Globals.bought_weapons[0].scene_path).instantiate())
		held_weapons[0] = gun_positions._1.get_children()[0]
	if Globals.bought_weapons[1] != null:
		gun_positions._2.add_child(load(Globals.bought_weapons[1].scene_path).instantiate())
		held_weapons[1] = gun_positions._2.get_children()[0]
	if Globals.bought_weapons[2] != null:
		gun_positions._3.add_child(load(Globals.bought_weapons[2].scene_path).instantiate())
		held_weapons[2] = gun_positions._3.get_children()[0]
	if Globals.bought_weapons[3] != null:
		gun_positions._4.add_child(load(Globals.bought_weapons[3].scene_path).instantiate())
		held_weapons[3] = gun_positions._4.get_children()[0]
	if Globals.bought_weapons[4] != null:
		gun_positions._5.add_child(load(Globals.bought_weapons[4].scene_path).instantiate())
		held_weapons[4] = gun_positions._5.get_children()[0]
	if Globals.bought_weapons[5] != null:
		gun_positions._6.add_child(load(Globals.bought_weapons[5].scene_path).instantiate())
		held_weapons[5] = gun_positions._6.get_children()[0]
	if Globals.bought_weapons[6] != null:
		gun_positions._7.add_child(load(Globals.bought_weapons[6].scene_path).instantiate())
		held_weapons[6] = gun_positions._7.get_children()[0]
	if Globals.bought_weapons[7] != null:
		gun_positions._8.add_child(load(Globals.bought_weapons[7].scene_path).instantiate())
		held_weapons[7] = gun_positions._8.get_children()[0]
	
	print("Held Weapons: ", held_weapons)

func _create_items():
	for i in Globals.bought_items:
		add_child(load(i.scene_path).instantiate())

func _player_take_damage(ammont: float, who: Node2D):
	health.minus_equals(Globals.get_percentage(ammont, 100 - PlayerStats.armour))
	if who is EnemyEntity:
		print(who.data.enemy_name)

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

func _entity_damaged(who: EnemyEntity, damage: BigNumber):
	pass

func _round_start():
	pass

func _round_end():
	pass

func _time_passed(time: int):
	pass
