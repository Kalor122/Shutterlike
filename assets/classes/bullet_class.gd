extends Entity
class_name BulletEntity

@export var data: BulletData
var direction = Vector2.RIGHT
var parent: Node2D
var distance_from_parent: Vector2

@export var speed: float = 1500.0
@export var damage: float = 0.0

func _ready() -> void:
	damage = data.damage
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
