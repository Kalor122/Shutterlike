extends Entity
class_name EnemyEntity

@export var data: EnemyData

var target: Entity
var stage: Stage
var distance_from_target: Vector2

var speed: float
var health: BigNumber = BigNumber.new()
var cash: int = 3

const DAMAGE_LABEL = preload("uid://dtq2itvuajs1m")

func _give_cash():
	Globals.rupies.plus_equals(randi_range(1, cash))

func _ready() -> void:
	health.mantissa = 0
	health.exponent = 0
	health.plus_equals(data.health)
	speed = data.speed
	cash = data.cash
	GlobalSignals.enemy_hit.connect(_enemy_hit)
	start()

func _process(delta: float) -> void:
	update(delta)

func _physics_process(delta: float) -> void:
	distance_from_target = global_position - target.global_position
	physics_update(delta)

func start():
	pass

func update(delta: float):
	pass

func physics_update(delta: float):
	pass

func _enemy_hit(who: EnemyEntity, parent: Node2D, damage: BigNumber):
	pass
