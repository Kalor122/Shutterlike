extends Entity
class_name BulletEntity

@export var data: BulletData
var direction = Vector2.RIGHT

func _ready() -> void:
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
