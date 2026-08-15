extends EnemyEntity

@onready var sprite: Sprite2D = $Sprite2D
@onready var ray_cast: RayCast2D = $RayCast2D
@onready var animation_player: AnimationPlayer = $Sprite2D/AnimationPlayer

func start():
	stage = get_parent()
	
	target = stage.player

func update(delta: float):
	ray_cast.look_at(target.global_position)
	
	if health.is_less_than(1):
		GlobalSignals.enemy_killed.emit(self)
		_give_cash()
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

func _entity_damaged(who: EnemyEntity, damage: BigNumber):
	if who == self:
		animation_player.stop()
		animation_player.play("hit")
		var d = DAMAGE_LABEL.instantiate()
		d.global_position.y = randf_range(who.global_position.y - 5, who.global_position.y + 5)
		d.global_position.x = randf_range(who.global_position.x - 20, who.global_position.x + 20)
		get_tree().current_scene.add_child(d)
		d.display("-" + str(Globals.format(damage)))

func _on_hitbox_area_entered(area: Area2D) -> void:
	GlobalSignals.player_take_damage.emit(1, self)
	queue_free()
