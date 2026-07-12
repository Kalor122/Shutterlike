extends Entity
class_name ExplosionEntity

@export var data: ExplosionData

var damage: float = 100.0
var size: float = 1.0
var duration: float = 0.5

func _ready():
	damage = data.damage
	size = data.size
	duration = data.duration
	_start()

func _start():
	pass
