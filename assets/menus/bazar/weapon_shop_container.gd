extends PanelContainer

const WEAPON_TOOLTIP = preload("uid://bl8iqg2wwr4a4")

@onready var weapon_portrait: TextureRect = $MarginContainer/VBoxContainer/PanelContainer/WeaponPortrait
@onready var buy: Button = $MarginContainer/VBoxContainer/Buy
@onready var price: Label = $MarginContainer/VBoxContainer/HBoxContainer/Price
@onready var paper: PanelContainer = $MarginContainer/VBoxContainer/PanelContainer

@export var data: WeaponData

var w_tooltip

func _ready() -> void:
	if data:
		data.calculate_money()
		_create_tooltip()

func _process(delta: float) -> void:
	if data:
		weapon_portrait.texture = data.weapon_portrait
		price.text = Globals.format(data.big_price)
		match data.weapon_rarity:
			Globals.Rarities.COMMON:
				paper.self_modulate = Color(0.25, 0.34, 0.218, 1.0)
				paper.material = null
			Globals.Rarities.RARE:
				paper.self_modulate = Color(0.267, 0.218, 0.34, 1.0)
				paper.material = null
			Globals.Rarities.EPIC:
				paper.self_modulate = Color(0.34, 0.218, 0.218, 1.0)
				paper.material = null
			Globals.Rarities.GODLIKE:
				paper.self_modulate = Color(1.0, 1.0, 1.0, 1.0)
				paper.material = ShaderMaterial.new()
				paper.material.shader = load("uid://248k74bv46yk")

func _on_buy_pressed() -> void:
	if Globals.rupies.is_greater_than_or_equal_to(data.big_price):
		for i in range(Globals.bought_weapons.size()):
			if Globals.bought_weapons[i] == null:
				Globals.bought_weapons[i] = data
				print(Globals.bought_weapons)
				break
		Globals.rupies.minus_equals(data.big_price)
		GlobalSignals.thing_bought.emit(data)
		queue_free()
	else:
		GlobalSignals.cant_afford.emit(data)

func _create_tooltip():
	var w = WEAPON_TOOLTIP.instantiate()
	w.data = data
	w_tooltip = w
	get_tree().current_scene.add_child(w_tooltip)
	w_tooltip.hide()

func _on_mouse_entered() -> void:
	w_tooltip.should_hide.emit(false)

func _on_mouse_exited() -> void:
	w_tooltip.should_hide.emit(true)
