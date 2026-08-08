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
	scene_loader.load_scene("res://assets/menus/bazar/bazar.tscn")
	

func _ready() -> void:
	time = ceil((10 * (log(Globals.zone) + 1)) * (log(Globals.round) + 1))
	timer.timeout.connect(_timeout)
	GlobalSignals.time_passed.connect(_time_passed)
	_start()

func _process(delta: float) -> void:
	pass

func _timeout():
	time -= 1
	GlobalSignals.time_passed.emit(time)

func _start():
	pass

func _time_passed(time: int):
	pass
