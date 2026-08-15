extends EnemyEntity

@onready var sprite: Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $Sprite2D/AnimationPlayer
@onready var animation_player_2: AnimationPlayer = $AnimationPlayer
@onready var timer: Timer = $Timer
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var collision_shape_2d_2: CollisionShape2D = $Hitbox/CollisionShape2D
@onready var cross: Sprite2D = $Cross

var jumping = false

func start():
	stage = get_parent()
	
	target = stage.player
	collision_shape_2d.disabled = false
	collision_shape_2d_2.disabled = false
	cross.hide()

func update(delta: float):
	if health.is_less_than(1):
		GlobalSignals.enemy_killed.emit(self)
		_give_cash()
		queue_free()

func physics_update(delta: float):
	if not jumping:
		velocity = (target.global_position - global_position).normalized() * speed
		_update_animation()
		move_and_slide()

func _update_animation():
	if distance_from_target.x < 0:
		sprite.flip_h = false
	if distance_from_target.x > 0:
		sprite.flip_h = true

func _jump():
	animation_player_2.play("jump")
	jumping = true

func _on_timer_timeout() -> void:
	_jump()

func _set_pos():
	global_position = stage.player.global_position

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "fall":
		jumping = false
		timer.start()

func _on_hitbox_area_entered(area: Area2D) -> void:
	GlobalSignals.player_take_damage.emit(2, self)

func _entity_damaged(who: EnemyEntity, damage: BigNumber):
	if who == self:
		animation_player.stop()
		animation_player.play("hit")
		var d = DAMAGE_LABEL.instantiate()
		d.global_position.y = randf_range(who.global_position.y - 5, who.global_position.y + 5)
		d.global_position.x = randf_range(who.global_position.x - 20, who.global_position.x + 20)
		get_tree().current_scene.add_child(d)
		d.display("-" + str(Globals.format(damage)))
