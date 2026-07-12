extends Resource
class_name EnemyData

@export var enemy_name: String
@export var speed: float = 100.0
@export var health: int = 10
@export var cash: int = 3
@export_file_path("*.tscn") var scene_path: String
