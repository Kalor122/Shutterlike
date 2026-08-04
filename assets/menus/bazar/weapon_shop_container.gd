extends PanelContainer

const WEAPON_TOOLTIP = preload("uid://bl8iqg2wwr4a4")

@onready var weapon_portrait: TextureRect = $MarginContainer/VBoxContainer/WeaponPortrait
@onready var buy: Button = $MarginContainer/VBoxContainer/Buy
@onready var price: Label = $MarginContainer/VBoxContainer/HBoxContainer/Price

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
