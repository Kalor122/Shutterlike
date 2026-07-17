extends Entity
class_name BulletEntity

@export var data: BulletData
var direction = Vector2.RIGHT
var parent: Node2D
var distance_from_parent: Vector2

var speed: float = 1500.0
var damage: BigNumber = BigNumber.new()

func _ready() -> void:
	damage.exponent = 0
	damage.mantissa = 0
	damage.plus_equals(data.damage)
	speed = data.speed
	start()

func _process(delta: float) -> void:
	update(delta)

func _physics_process(delta):
	physics_update(delta)

func start():
	pass

func update(delta: float):
	pass

func physics_update(delta: float):
	pass
