extends EntityEffect

var damage = BigNumber.new()
@onready var duration: Timer = $Duration

func _on_timer_timeout() -> void:
	entity.take_damage(entity.health, damage, [])
	print("FIREEEE")

func _on_duration_timeout() -> void:
	queue_free()
	print("FIREEEE bye lol")

func _effect_gained(what: EntityEffectData):
	if what.effect_id == data.effect_id:
		stack += 1
		damage.mantissa = 0
		damage.exponent = 0
		damage.plus_equals(1)
		damage.multiply_equals(stack)
