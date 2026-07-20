extends BulletEntity

func physics_update(delta: float):
	velocity = direction * speed
	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	print(body)
	if body is EnemyEntity:
		if not body.health.is_less_than_or_equal_to(damage):
			body.health.minus_equals(damage)
		else:
			body.health.minus_equals(body.health)
		GlobalSignals.enemy_hit.emit(body, parent, damage)
		print(damage)
	queue_free()

func _on_timer_timeout() -> void:
	queue_free()
