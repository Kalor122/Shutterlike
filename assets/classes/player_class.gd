extends Entity
class_name PlayerEntity

@export var data: PlayerData
@export var sprite: AnimatedSprite2D
@export var gun_positions: Node2D

var direction_x = 1
var direction_y = 1

@export var speed: float
@export var acceleration: float
@export var health: int

func _ready():
	speed = data.speed
	acceleration = data.acceleration
	health = data.health
	_create_weapons()
	GlobalSignals.round_start.emit()

func _physics_process(delta: float) -> void:
	direction_x = Input.get_axis("left", "right")
	direction_y = Input.get_axis("up", "down")
	
	if direction_x != 0:
		velocity.x = move_toward(velocity.x, speed * direction_x, acceleration * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, acceleration * delta)
	
	if direction_y != 0:
		velocity.y = move_toward(velocity.y, speed * direction_y, acceleration * delta)
	else:
		velocity.y = move_toward(velocity.y, 0, acceleration * delta)
	
	_update_animation()
	move_and_slide()

func _update_animation():
	if direction_x == 1:
		sprite.flip_h = false
	if direction_x == -1:
		sprite.flip_h = true

func _create_weapons():
	if Globals.bought_weapons[0] != null:
		gun_positions._1.add_child(load(Globals.bought_weapons[0].scene_path).instantiate())
	if Globals.bought_weapons[1] != null:
		gun_positions._2.add_child(load(Globals.bought_weapons[1].scene_path).instantiate())
	if Globals.bought_weapons[2] != null:
		gun_positions._3.add_child(load(Globals.bought_weapons[2].scene_path).instantiate())
	if Globals.bought_weapons[3] != null:
		gun_positions._4.add_child(load(Globals.bought_weapons[3].scene_path).instantiate())
	if Globals.bought_weapons[4] != null:
		gun_positions._5.add_child(load(Globals.bought_weapons[4].scene_path).instantiate())
	if Globals.bought_weapons[5] != null:
		gun_positions._6.add_child(load(Globals.bought_weapons[5].scene_path).instantiate())
	if Globals.bought_weapons[6] != null:
		gun_positions._7.add_child(load(Globals.bought_weapons[6].scene_path).instantiate())
	if Globals.bought_weapons[7] != null:
		gun_positions._8.add_child(load(Globals.bought_weapons[7].scene_path).instantiate())
