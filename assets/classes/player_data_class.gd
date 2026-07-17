extends Resource
class_name PlayerData

@export var player_name: String
@export var speed: float = 400.0
@export var acceleration: float = 3000.0
@export var health: int = 10

func _init() -> void:
	PlayerStats.health.exponent = 0
	PlayerStats.health.mantissa = 0
	PlayerStats.health.plus_equals(health)
