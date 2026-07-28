extends BulletEntity

func physics_update(delta: float):
	velocity = direction * speed
	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	print(body)
	if body is EnemyEntity:
		body.take_damage(body.health, damage, entity_effects)
		GlobalSignals.enemy_hit.emit(body, parent, damage)
	queue_free()
