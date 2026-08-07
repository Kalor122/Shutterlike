extends Item

func _round_start():
	player.held_weapons[3].pow_damage(20)

func _on_timer_timeout() -> void:
	player.held_weapons[3].sub_damage(1000)
