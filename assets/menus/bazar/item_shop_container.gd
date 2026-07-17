extends PanelContainer

@onready var item_portrait: TextureRect = $MarginContainer/VBoxContainer/ItemPortrait
@onready var buy: Button = $MarginContainer/VBoxContainer/Buy
@onready var price: Label = $MarginContainer/VBoxContainer/HBoxContainer/Price

@export var data: ItemData

func _ready() -> void:
	if data:
		data.calculate_money()

func _process(delta: float) -> void:
	if data:
		item_portrait.texture = data.item_portrait
		price.text = Globals.format(data.big_price)

func _on_buy_pressed() -> void:
	if Globals.rupies.is_greater_than_or_equal_to(data.big_price):
		Globals.bought_items.append(data)
		Globals.rupies.minus_equals(data.big_price)
		GlobalSignals.thing_bought.emit(data)
		queue_free()
	else:
		GlobalSignals.cant_afford.emit(data)
