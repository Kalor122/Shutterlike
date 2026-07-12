extends BulletEntity

const DEFAULT_EXPLOSION = preload("uid://b4dxbvjsxfpvm")

func physics_update(delta: float):
	velocity = direction * speed
	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	print(body)
	if body is EnemyEntity:
		var e: ExplosionEntity = DEFAULT_EXPLOSION.instantiate()
		e.global_position = body.global_position
		get_tree().current_scene.add_child(e)
		e.explode(250, parent.damage)
		GlobalSignals.enemy_hit.emit(body, parent)
		print(damage)
	queue_free()
