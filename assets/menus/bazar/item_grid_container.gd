extends PanelContainer

@onready var item_portrait: TextureRect = $ItemPortrait
const ITEM_TOOLTIP = preload("uid://5tfugo6smf6x")

var data: ItemData
var i_tooltip

func _ready() -> void:
	_create_tooltip()

func _process(delta: float) -> void:
	if data:
		item_portrait.texture = data.item_portrait
		match data.item_rarity:
			Globals.Rarities.COMMON:
				self_modulate = Color(0.25, 0.34, 0.218, 1.0)
				material = null
			Globals.Rarities.RARE:
				self_modulate = Color(0.267, 0.218, 0.34, 1.0)
				material = null
			Globals.Rarities.EPIC:
				self_modulate = Color(0.34, 0.218, 0.218, 1.0)
				material = null
			Globals.Rarities.GODLIKE:
				self_modulate = Color(1.0, 1.0, 1.0, 1.0)
				material = ShaderMaterial.new()
				material.shader = load("uid://248k74bv46yk")

func _create_tooltip():
	var i = ITEM_TOOLTIP.instantiate()
	i.data = data
	i_tooltip = i
	get_tree().current_scene.add_child(i_tooltip)
	i_tooltip.hide()

func _on_item_portrait_mouse_entered() -> void:
	i_tooltip.should_hide.emit(false)

func _on_item_portrait_mouse_exited() -> void:
	i_tooltip.should_hide.emit(true)
