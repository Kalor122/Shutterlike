extends Stage

func _on_timer_timeout() -> void:
	_spawn_enemy(load("uid://ddwosdl8s2wi"), Vector2(randi_range(0, 2000), randi_range(0, 2000)))

func _start():
	if Globals.no_weapons():
		Globals.give_weapon(load("res://assets/weapons/ak47/ak47_data.tres"))
		player._create_weapons()

func _time_passed(time: int):
	print(time)
	if time == 0:
		_finish()
