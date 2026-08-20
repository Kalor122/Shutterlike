extends PlayerEntity

func _on_health_regeneration_timeout() -> void:
	if health.is_less_than(PlayerStats.health):
		health.plus_equals(PlayerStats.health_regeneration.to_float() / 100)
