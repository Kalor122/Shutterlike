extends Item

func _round_start():
	if player.held_weapons[5] != null:
		player.held_weapons[5].mult_damage(1.2)
	
	if player.held_weapons[6] != null:
		player.held_weapons[6].mult_damage(1.2)
	
	if player.held_weapons[7] != null:
		player.held_weapons[7].mult_damage(1.2)
