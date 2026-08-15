extends Item

func _round_start():
	if player.held_weapons[3] != null:
		player.held_weapons[3].pow_damage(1.025)
