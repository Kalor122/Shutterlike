extends Node2D
class_name Weapon

@export var data: WeaponData

var player: PlayerEntity

func _ready() -> void:
	player = get_tree().current_scene.player
	GlobalSignals.enemy_spawned.connect(_enemy_spawned)
	GlobalSignals.enemy_killed.connect(_enemy_killed)
	GlobalSignals.round_start.connect(_round_start)
	GlobalSignals.round_end.connect(_round_end)
	_start()

func _process(delta: float) -> void:
	_update(delta)

func _physics_process(delta: float) -> void:
	_physics_update(delta)

func _shoot(bullet: PackedScene, exit: Node2D, damage: float):
	var instance = bullet.instantiate()
	if instance is BulletEntity:
		instance.global_position = exit.global_position
		instance.global_rotation = exit.global_rotation
		instance.direction = instance.direction.rotated(exit.global_rotation)
		instance.data.damage = damage
		get_tree().current_scene.add_child(instance)

func _start():
	pass

func _update(delta: float):
	pass

func _physics_update(delta: float):
	pass

func _enemy_spawned(who):
	pass

func _enemy_killed(who):
	pass

func _round_start():
	pass

func _round_end():
	pass
