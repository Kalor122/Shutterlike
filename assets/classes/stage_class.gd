extends Node2D
class_name Stage

var data: StageData
@export var camera: StageCamera
@export var player: PlayerEntity

func _spawn_enemy(enemy: EnemyData, position: Vector2):
	var e: EnemyEntity = load(enemy.scene_path).instantiate()
	e.global_position = position
	add_child(e)

func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	pass
