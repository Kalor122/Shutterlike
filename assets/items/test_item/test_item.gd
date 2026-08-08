extends Item

func _start():
	print(data.item_name)

func _time_passed(time: int):
	PlayerStats.damage_multiplier *= 1.75
	GlobalSignals.recalculate_stats.emit()
