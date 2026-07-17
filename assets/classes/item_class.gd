extends Node
class_name Item

@export var data: ItemData

func _ready() -> void:
	GlobalSignals.enemy_spawned.connect(_enemy_spawned)
	GlobalSignals.enemy_killed.connect(_enemy_killed)
	GlobalSignals.enemy_hit.connect(_enemy_hit)
	GlobalSignals.round_start.connect(_round_start)
	GlobalSignals.round_end.connect(_round_end)
	GlobalSignals.time_passed.connect(_time_passed)
	_start()

func _process(delta: float) -> void:
	_update(delta)

func _physics_process(delta: float) -> void:
	_physics_update(delta)

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

func _time_passed(time: int):
	pass
