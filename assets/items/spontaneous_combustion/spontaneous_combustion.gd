extends Item

const SPONTANEOUS_COMBUSTION_EX = preload("uid://bgwkv7pkwvdiq")

var dmg = BigNumber.new()
var already_exploded = false

func _time_passed(time: int):
	if not already_exploded:
		if Globals.chance(35):
			var e: ExplosionEntity = SPONTANEOUS_COMBUSTION_EX.instantiate()
			e.global_position = player.global_position
			get_tree().current_scene.add_child(e)
			dmg.exponent = 0
			dmg.mantissa = 0
			dmg.plus_equals(8 * PlayerStats.damage_multiplier)
			e.explode(500, dmg)
			GlobalSignals.player_take_damage.emit(10, player)
			already_exploded = true
