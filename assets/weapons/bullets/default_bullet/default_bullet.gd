extends BulletEntity

func physics_update(delta: float):
	velocity = direction * data.speed
	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	print(body)
	if body is EnemyEntity:
		body.health -= data.damage
	queue_free()
