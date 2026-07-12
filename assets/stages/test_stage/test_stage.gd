extends Stage

func _on_timer_timeout() -> void:
	_spawn_enemy(load("uid://ddwosdl8s2wi"), Vector2(randi_range(0, 2000), randi_range(0, 2000)))
