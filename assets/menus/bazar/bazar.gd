extends Control

const WEAPON_SHOP_CONTAINER = preload("uid://feyrdmek04nu")

@onready var wsc_box: HBoxContainer = $TabContainer/Shop/MarginContainer/HBoxContainer/VBoxContainer/WSCBox
@onready var scene_loader: SceneLoader = $SceneLoader

func _ready():
	GlobalSignals.thing_bought.connect(_thing_bought)
	
	for i in range(4):
		var w = WEAPON_SHOP_CONTAINER.instantiate()
		w.data = Weapons.choose_weapon()
		wsc_box.add_child(w)

func _thing_bought(what):
	if what == Weapons.get_weapon_by_id(0):
		print(what)

func _on_continue_pressed() -> void:
	scene_loader.load_scene("res://assets/stages/test_stage/test_stage.tscn")
