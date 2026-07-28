extends Node
class_name EntityEffect

@export var data: EntityEffectData

var entity: Entity
var stack: float = 0.0

func _ready() -> void:
	entity = get_parent()
	entity.effect_gained.connect(_effect_gained)
	_start()

func _process(delta: float) -> void:
	_update(delta)

func _physics_process(delta: float) -> void:
	_physics_update(delta)

func _start():
	pass

func _update(delta: float):
	pass

func _physics_update(delta: float):
	pass

func _effect_gained(what: EntityEffectData):
	pass
