extends BulletEntity

const RP_AREA = preload("uid://bjps56px7n3qe")
var ef: Array[EntityEffectData] = []

func physics_update(delta: float):
	velocity = direction * speed
	move_and_slide()

func _create_poison():
	var rp = RP_AREA.instantiate()
	rp.global_position = global_position
	get_tree().current_scene.add_child(rp)
	queue_free()

func _on_area_2d_body_entered(body: Node2D) -> void:
	print(body)
	if body is EnemyEntity:
		body.take_damage(body.health, damage, ef)
		_create_poison()
	queue_free()

func _on_timer_timeout() -> void:
	_create_poison()
