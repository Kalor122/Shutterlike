extends GridContainer

var parent: Entity

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
			var img = TextureRect.new()
			img.expand_mode = 2
			img.custom_minimum_size = Vector2(30, 30)
			img.texture = i.data.effect_image
			add_child(img)

func _effect_gained(what: EntityEffectData):
	_create()
