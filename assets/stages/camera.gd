extends Camera2D
class_name StageCamera

@export var target: Entity
@export var following: bool = true

func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	if following:
		global_position = target.global_position
