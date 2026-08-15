extends Node2D
class_name Stage

var data: StageData
@export var camera: StageCamera
@export var player: PlayerEntity
@export var stage_ui: CanvasLayer
@export var timer: Timer
@export var scene_loader: SceneLoader

var time: int = 10

func _spawn_enemy(enemy: EnemyData, position: Vector2):
	var e: EnemyEntity = load(enemy.scene_path).instantiate()
	e.global_position = position
	add_child(e)

func _finish():
	timer.stop()
	for i in get_children():
		if i is EnemyEntity:
			i.queue_free()
	await get_tree().create_timer(1).timeout
	stage_ui.animation_player.play("closing")
	await stage_ui.animation_player.animation_finished
	scene_loader.load_scene("res://assets/menus/bazar/bazar.tscn")

func _ready() -> void:
	time = ceil((15 * (log(Globals.zone) + 1)) * (log(Globals.round) + 1))
	timer.timeout.connect(_timeout)
	GlobalSignals.enemy_spawned.connect(_enemy_spawned)
	GlobalSignals.enemy_killed.connect(_enemy_killed)
	GlobalSignals.enemy_hit.connect(_enemy_hit)
	GlobalSignals.entity_damaged.connect(_entity_damaged)
	GlobalSignals.round_start.connect(_round_start)
	GlobalSignals.round_end.connect(_round_end)
	GlobalSignals.player_take_damage.connect(_player_take_damage)
	GlobalSignals.time_passed.connect(_time_passed)
	GlobalSignals.game_over.connect(_on_game_over)
	_start()

func _process(delta: float) -> void:
	_update(delta)

func _physics_process(delta: float) -> void:
	_physics_update(delta)

func _timeout():
	time -= 1
	GlobalSignals.time_passed.emit(time)

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

func _on_game_over():
	pass

func _player_take_damage(ammont: float, who: Node2D):
	pass
