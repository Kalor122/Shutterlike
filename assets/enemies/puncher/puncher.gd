extends EnemyEntity

@onready var sprite: Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $Sprite2D/AnimationPlayer
@onready var feet_2: Sprite2D = $feet2
@onready var hand_2: Sprite2D = $hand2
@onready var feet: Sprite2D = $feet
@onready var hand: Sprite2D = $hand
@onready var animation_player_2: AnimationPlayer = $AnimationPlayer

var punching = false

func start():
	stage = get_parent()
	
	target = stage.player

func update(delta: float):
	if health.is_less_than(1):
		GlobalSignals.enemy_killed.emit(self)
		_give_cash()
		queue_free()

func physics_update(delta: float):
	if animation_player_2.current_animation == "walk":
		punching = false
	if not punching:
		velocity = (target.global_position - global_position).normalized() * speed
		_update_animation()
		move_and_slide()

func _update_animation():
	if distance_from_target.x < 0:
		sprite.flip_h = false
		hand.flip_h = true
		hand_2.flip_h = true
	if distance_from_target.x > 0:
		sprite.flip_h = true
		hand.flip_h = false
		hand_2.flip_h = false

func _on_area_area_entered(area: Area2D) -> void:
	if distance_from_target.x < 0:
		animation_player_2.play("punch")
		punching = true
	if distance_from_target.x > 0:
		animation_player_2.play("punch_2")
		punching = true

func _on_hitbox_area_entered(area: Area2D) -> void:
	GlobalSignals.player_take_damage.emit(5, self)

func _entity_damaged(who: EnemyEntity, damage: BigNumber):
	if who == self:
		animation_player.stop()
		animation_player.play("hit")
		var d = DAMAGE_LABEL.instantiate()
		d.global_position.y = randf_range(who.global_position.y - 5, who.global_position.y + 5)
		d.global_position.x = randf_range(who.global_position.x - 20, who.global_position.x + 20)
		get_tree().current_scene.add_child(d)
		d.display("-" + str(Globals.format(damage)))
