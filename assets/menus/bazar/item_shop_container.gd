extends PanelContainer

const ITEM_TOOLTIP = preload("uid://5tfugo6smf6x")

@onready var item_portrait: TextureRect = $MarginContainer/VBoxContainer/ItemPortrait
@onready var buy: Button = $MarginContainer/VBoxContainer/Buy
@onready var price: Label = $MarginContainer/VBoxContainer/HBoxContainer/Price

@export var data: ItemData

var i_tooltip

func _ready() -> void:
	if data:
		data.calculate_money()
	_create_tooltip()

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

func _create_tooltip():
	var i = ITEM_TOOLTIP.instantiate()
	i.data = data
	i_tooltip = i
	get_tree().current_scene.add_child(i_tooltip)
	i_tooltip.hide()

func _on_mouse_entered() -> void:
	i_tooltip.should_hide.emit(false)

func _on_mouse_exited() -> void:
	i_tooltip.should_hide.emit(true)
