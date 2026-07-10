extends EnemyEntity

@onready var sprite: Sprite2D = $Sprite2D
@onready var ray_cast: RayCast2D = $RayCast2D

func start():
	stage = get_parent()
	
	target = stage.player

func update(delta: float):
	ray_cast.look_at(target.global_position)
	
	if health.is_less_than(1):
		GlobalSignals.enemy_killed.emit(self)
		queue_free()

func physics_update(delta: float):
	velocity = (target.global_position - global_position).normalized() * speed
	_update_animation()
	move_and_slide()

func _update_animation():
	if distance_from_target.x < 0:
		sprite.flip_h = false
	if distance_from_target.x > 0:
		sprite.flip_h = true
