extends Entity
class_name ExplosionEntity

@export var data: ExplosionData

var damage: BigNumber = BigNumber.new()
var size: float = 1.0
var duration: float = 0.5

var entity_effects: Array[EntityEffectData] = []

func _ready():
	damage.exponent = 0
	damage.mantissa = 0
	damage.plus_equals(data.damage)
	size = data.size
	duration = data.duration
	_start()

func _start():
	pass
