extends ExplosionEntity

@onready var area_2d: Area2D = $Area2D
@onready var sprite_2d: Sprite2D = $Area2D/Sprite2D

var t
var t2

func explode(target_size, target_damage):
	size = target_size
	damage = target_damage
	if t:
		t.kill()
	if t2:
		t2.kill()
	t = get_tree().create_tween()
	t.tween_property(area_2d, "scale", Vector2(size, size), duration)
	t2 = get_tree().create_tween()
	t2.tween_property(sprite_2d, "modulate", Color(1.0, 1.0, 1.0, 0.0), duration)
	t.tween_callback(queue_free)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is EnemyEntity:
		if not body.health.is_less_than_or_equal_to(damage):
			body.health.minus_equals(damage)
		else:
			body.health.minus_equals(body.health)
