extends PanelContainer

signal should_hide(visibility: bool)

@onready var w_image: TextureRect = $MarginContainer/VBoxContainer/HBoxContainer/WImage
@onready var w_name: Label = $MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer/WName
@onready var w_rarity: Label = $MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer/WRarity
@onready var w_tags: Label = $MarginContainer/VBoxContainer/HBoxContainer2/WTags
@onready var bd_label: Label = $MarginContainer/VBoxContainer/BaseDamage/MarginContainer/HBoxContainer/Label2
@onready var fr_label: Label = $MarginContainer/VBoxContainer/FireRate/MarginContainer/HBoxContainer/Label2

var data: WeaponData

var dmg = BigNumber.new()

func _enter_tree() -> void:
	name = "WeaponTooltip"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	should_hide.connect(_should_hide)
	print(get_viewport_rect().size)
	dmg.mantissa = 0
	dmg.exponent = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var viewport_size = get_viewport_rect().size
	position.x = clamp(position.x, 0, viewport_size.x - size.x)
	position.y = clamp(position.y, 0, viewport_size.y - size.y)
	
	if data:
		w_image.texture = data.weapon_portrait
		w_name.text = data.weapon_name
		w_rarity.text = str(data.weapon_rarity)
		bd_label.text = Globals.format(dmg.plus(data.damage * PlayerStats.damage_multiplier))
		fr_label.text = str(Globals.round_to_dec(data.fire_rate - ((float(PlayerStats.attack_speed) ** 0.6) / 100), 2)) + "s"

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		global_position = get_global_mouse_position()

func _should_hide(visibility: bool):
	visible = not visibility
