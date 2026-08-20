extends Item

func _round_start():
	for i in range(player.held_weapons.size()):
		if i % 2 == 0:
			if player.held_weapons[i] != null:
				player.held_weapons[i].sub_fire_rate(0.025)
