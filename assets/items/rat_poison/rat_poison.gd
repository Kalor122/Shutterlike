extends Item

const RP_SHOOTER = preload("uid://b0gvu8ty1nmyw")
const RAT_POISON_BULLET = preload("uid://djbb03pedu6je")

var rps: Marker2D

func _round_start():
	rps = RP_SHOOTER.instantiate()
	player.add_child(rps)

func _on_timer_timeout() -> void:
	var dmg = BigNumber.new()
	dmg.exponent = 0
	dmg.mantissa = 0
	dmg.plus_equals(1.5 * PlayerStats.damage_multiplier)
	rps.rotation_degrees = randf_range(-360.0, 360.0)
	rps._shoot(RAT_POISON_BULLET, rps, dmg)
