extends Area2D

var t
@onready var sprite: Sprite2D = $Sprite
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

func _ready() -> void:
	if t:
		t.kill()
	t = get_tree().create_tween()
	t.tween_property(sprite, "scale", Vector2(0.5, 0.5), 0.5).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC)
	t.set_parallel()
	t.tween_property(collision_shape_2d, "scale", Vector2(0.5, 0.5), 0.5).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC)

func _on_body_entered(body: Node2D) -> void:
	if body is EnemyEntity:
		body.give_entity_effect([load("uid://bgc7bxikgi5yf")])

func _on_timer_timeout() -> void:
	if t:
		t.kill()
	t = get_tree().create_tween()
	t.tween_property(sprite, "scale", Vector2(0, 0), 0.5).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC)
	t.set_parallel()
	t.tween_property(collision_shape_2d, "scale", Vector2(0, 0), 0.5).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC)
	await t.finished
	queue_free()
