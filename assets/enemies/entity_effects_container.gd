extends VBoxContainer

var parent: Entity
const ENTITY_EFFECTS_LABEL = preload("uid://cegvdahsf4pqk")

func _ready() -> void:
	parent = get_parent()
	parent.effect_gained.connect(_effect_gained)

func _process(delta: float) -> void:
	pass

func _create():
	for i in get_children():
		i.queue_free()
	
	for i in parent.get_children():
		if i is EntityEffect:
			var eel = ENTITY_EFFECTS_LABEL.instantiate()
			add_child(eel)
			eel.texture_rect.texture = i.data.effect_image
			eel.label.text = "x" + str(i.stack)

func _effect_gained(what: EntityEffectData):
	_create()
