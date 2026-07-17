extends Item

func _start():
	print(data.item_name)

func _enemy_killed(who: EnemyEntity):
	PlayerStats.attack_speed_percent -= 3
	GlobalSignals.recalculate_stats.emit()
