extends PanelContainer

signal should_hide(visibility: bool)

@onready var w_name: Label = $MarginContainer/VBoxContainer/HBoxContainer/WName
@onready var w_rarity: TextureRect = $MarginContainer/VBoxContainer/HBoxContainer/WRarity
@onready var w_tags: Label = $MarginContainer/VBoxContainer/HBoxContainer2/WTags
@onready var bd_label: Label = $MarginContainer/VBoxContainer/BaseDamage/MarginContainer/HBoxContainer/Label2
@onready var fr_label: Label = $MarginContainer/VBoxContainer/FireRate/MarginContainer/HBoxContainer/Label2
@onready var rainbow: Panel = $Rainbow
@onready var godlike: GIFPlayer = $MarginContainer/VBoxContainer/HBoxContainer/GODLIKE
@onready var dps_label: Label = $MarginContainer/VBoxContainer/DPS/MarginContainer/HBoxContainer/Label2
@onready var w_description: RichTextLabel = $MarginContainer/VBoxContainer/WDescription

const COMMON = preload("uid://b1vjvgdhqgb23")
const EPIC = preload("uid://pobsvp0inmi4")
const RARE = preload("uid://bja4hail1mi8u")

var data: WeaponData

var dmg = BigNumber.new()

var slot = 0

func _enter_tree() -> void:
	name = "WeaponTooltip"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	should_hide.connect(_should_hide)
	dmg.mantissa = 0
	dmg.exponent = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var viewport_size = get_viewport_rect().size
	position.x = clamp(position.x, 0, viewport_size.x - size.x)
	position.y = clamp(position.y, 0, viewport_size.y - size.y)
	
	if data:
		w_name.text = data.weapon_name
		w_description.text = ""
		w_description.append_text(data.weapon_description)
		match data.weapon_rarity:
			Globals.Rarities.COMMON:
				w_rarity.texture = COMMON
				rainbow.hide()
				godlike.hide()
				w_rarity.show()
			Globals.Rarities.RARE:
				w_rarity.texture = RARE
				rainbow.hide()
				godlike.hide()
				w_rarity.show()
			Globals.Rarities.EPIC:
				w_rarity.texture = EPIC
				rainbow.hide()
				godlike.hide()
				w_rarity.show()
			Globals.Rarities.GODLIKE:
				rainbow.show()
				godlike.show()
				w_rarity.hide()
		if get_tree().current_scene is Stage:
			bd_label.text = Globals.format(get_tree().current_scene.player.held_weapons[slot].damage)
			fr_label.text = str(get_tree().current_scene.player.held_weapons[slot].fire_rate) + "s"
			dps_label.text = str(Globals.format(get_tree().current_scene.player.held_weapons[slot].damage_per_second))
		else:
			bd_label.text = Globals.format(dmg.plus(data.damage * PlayerStats.damage_multiplier))
			fr_label.text = str(Globals.round_to_dec(data.fire_rate - (float(PlayerStats.attack_speed) / 1000), 3)) + "s"
			dps_label.text = str(Globals.format(Globals.round_to_dec((1 / (data.fire_rate - (float(PlayerStats.attack_speed) / 1000))) * (data.damage * PlayerStats.damage_multiplier), 3)))

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		global_position = get_global_mouse_position()

func _should_hide(visibility: bool):
	visible = not visibility
