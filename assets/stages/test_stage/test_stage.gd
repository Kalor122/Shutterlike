extends Stage

func _on_timer_timeout() -> void:
	match randi_range(1, 5):
		1:
			_spawn_enemy(load("uid://ddwosdl8s2wi"), Vector2(randi_range(0, 2000), randi_range(0, 2000)))
		2:
			_spawn_enemy(load("uid://cvooxjsu0lygv"), Vector2(randi_range(0, 2000), randi_range(0, 2000)))
		3:
			_spawn_enemy(load("uid://crdu5i7oyswn1"), Vector2(randi_range(0, 2000), randi_range(0, 2000)))

func _start():
	if Globals.no_weapons():
		Globals.give_weapon(load("res://assets/weapons/ak47/ak47_data.tres"))
		player._create_weapons()

func _time_passed(time: int):
	print(time)
	if time == 0:
		_finish()

func _on_game_over():
	get_tree().quit()
