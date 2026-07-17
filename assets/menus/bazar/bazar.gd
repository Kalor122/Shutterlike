extends Control

const WEAPON_SHOP_CONTAINER = preload("uid://feyrdmek04nu")
const MORSHU_NORMAL_1 = preload("uid://bpssptm36foa5")
const MORSHU_NORMAL_2 = preload("uid://dr6nsfdselfia")
const MORSHU_WEAPONS = preload("uid://ds8fpl8lnis2w")

@onready var wsc_box: HBoxContainer = $TabContainer/Shop/MarginContainer/HBoxContainer/VBoxContainer/PanelContainer/MarginContainer/WSCBox
@onready var scene_loader: SceneLoader = $SceneLoader
@onready var video_stream_player: VideoStreamPlayer = $TabContainer/Shop/MarginContainer/HBoxContainer/VBoxContainer2/PanelContainer/MarginContainer/VideoStreamPlayer
@onready var weapon_image: TextureRect = $WeaponImage

func _ready():
	GlobalSignals.thing_bought.connect(_thing_bought)
	GlobalSignals.cant_afford.connect(_cant_afford)
	GlobalSignals.wi_weapon_grabbed.connect(_wi_weapon_grabbed)
	GlobalSignals.wi_weapon_dropped.connect(_wi_weapon_dropped)
	
	_choose_weapons()

func _choose_weapons():
	for i in wsc_box.get_children():
		i.queue_free()
	
	for i in range(4):
		var w = WEAPON_SHOP_CONTAINER.instantiate()
		w.data = Weapons.choose_weapon()
		while w.data == null:
			w.data = Weapons.choose_weapon()
		wsc_box.add_child(w)

func _process(delta: float) -> void:
	weapon_image.global_position = get_global_mouse_position()

func _thing_bought(what):
	if what == Weapons.get_weapon_by_id(0):
		print(what)

func _cant_afford(what):
	video_stream_player.stream = MORSHU_NORMAL_2
	video_stream_player.stream_position = 1.2
	video_stream_player.play()

func _on_continue_pressed() -> void:
	Globals.round += 1
	scene_loader.load_scene("res://assets/stages/test_stage/test_stage.tscn")

func _on_weapons_info_pressed() -> void:
	video_stream_player.stream = MORSHU_WEAPONS
	video_stream_player.play()

func _wi_weapon_grabbed(what: WeaponData):
	weapon_image.texture = what.weapon_portrait
	weapon_image.show()

func _wi_weapon_dropped(what: WeaponData, slot: int, target_slot: int):
	weapon_image.hide()
	if slot != target_slot:
		Globals.swap_weapons(slot, target_slot)

func _on_weapon_reroll_pressed() -> void:
	_choose_weapons()
