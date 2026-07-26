extends Item

func _start():
	print(data.item_name)

func _round_start():
	if player.held_weapons[2] != null:
		player.held_weapons[2].sub_fire_rate(0.5)

func _update(delta: float):
	if player.held_weapons[2] != null:
		player.held_weapons[2].follow_mouse = false
		player.held_weapons[2].rotation_degrees += 10
