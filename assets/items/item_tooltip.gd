extends PanelContainer

signal should_hide(visibility: bool)

@onready var i_name: Label = $MarginContainer/VBoxContainer/HBoxContainer/IName
@onready var i_rarity: TextureRect = $MarginContainer/VBoxContainer/HBoxContainer/IRarity
@onready var i_tags: Label = $MarginContainer/VBoxContainer/HBoxContainer2/ITags
@onready var i_description: RichTextLabel = $MarginContainer/VBoxContainer/IDescription

const COMMON = preload("uid://b1vjvgdhqgb23")
const EPIC = preload("uid://pobsvp0inmi4")
const RARE = preload("uid://bja4hail1mi8u")

var data: ItemData

func _enter_tree() -> void:
	name = "ItemTooltip"

func _ready() -> void:
	should_hide.connect(_should_hide)
	_set_data()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var viewport_size = get_viewport_rect().size
	position.x = clamp(position.x, 0, viewport_size.x - size.x)
	position.y = clamp(position.y, 0, viewport_size.y - size.y)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		global_position = get_global_mouse_position()

func _should_hide(visibility: bool):
	visible = not visibility

func _set_data():
	if data:
		i_name.text = data.item_name
		i_description.text = ""
		i_description.append_text(data.item_description)
		match data.item_rarity:
			Globals.Rarities.COMMON:
				i_rarity.texture = COMMON
			Globals.Rarities.RARE:
				i_rarity.texture = RARE
			Globals.Rarities.EPIC:
				i_rarity.texture = EPIC
