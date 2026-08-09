extends BulletEntity

const DEFAULT_EXPLOSION = preload("uid://b4dxbvjsxfpvm")
const FIREWORK_BULLET_1 = preload("uid://bb87ratykl408")
const FIREWORK_BULLET_2 = preload("uid://dktp50sh56c3g")
const FIREWORK_BULLET_3 = preload("uid://d0akys2jlv5kx")
const FIREWORK_BULLET_4 = preload("uid://c7r6j11cv3iqy")
const FIREWORK_BULLET_5 = preload("uid://c83k7bgqowjnr")
@onready var sprite_2d: Sprite2D = $Sprite2D

func start():
	match randi_range(1, 5):
		1:
			sprite_2d.texture = FIREWORK_BULLET_1
		2:
			sprite_2d.texture = FIREWORK_BULLET_2
		3:
			sprite_2d.texture = FIREWORK_BULLET_3
		4:
			sprite_2d.texture = FIREWORK_BULLET_4
		5:
			sprite_2d.texture = FIREWORK_BULLET_5

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
