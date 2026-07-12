extends PanelContainer

@onready var weapon_portrait: TextureRect = $MarginContainer/VBoxContainer/WeaponPortrait
@onready var buy: Button = $MarginContainer/VBoxContainer/Buy
@onready var price: Label = $MarginContainer/VBoxContainer/HBoxContainer/Price

@export var data: WeaponData

func _ready() -> void:
	data.calculate_money()

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
		queue_free()
