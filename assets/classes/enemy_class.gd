extends Entity
class_name EnemyEntity

@export var data: EnemyData

var target: Entity
var stage: Stage
var distance_from_target: Vector2

@export var speed: float
var health: BigNumber = BigNumber.new()

func _ready() -> void:
	health.mantissa = 0
	health.exponent = 0
	health.plus_equals(data.health)
	speed = data.speed
	start()

func _process(delta: float) -> void:
	update(delta)

func _physics_process(delta: float) -> void:
	distance_from_target = global_position - target.global_position
	physics_update(delta)

func start():
	pass

func update(delta: float):
	pass

func physics_update(delta: float):
	pass
