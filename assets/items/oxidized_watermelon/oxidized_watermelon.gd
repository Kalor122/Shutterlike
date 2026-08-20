extends Item

var count = 0.0

func _round_start():
	PlayerStats.damage_multiplier += 1.5
	GlobalSignals.recalculate_stats.emit()

func _on_timer_timeout() -> void:
	if count < 1.5:
		PlayerStats.damage_multiplier -= 0.1
		count += 0.1
		GlobalSignals.recalculate_stats.emit()
