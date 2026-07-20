extends Control

const WEAPON_SHOP_CONTAINER = preload("uid://feyrdmek04nu")
const ITEM_SHOP_CONTAINER = preload("uid://dojps7rk6v4sj")
const MORSHU_NORMAL_1 = preload("uid://bpssptm36foa5")
const MORSHU_NORMAL_2 = preload("uid://dr6nsfdselfia")
const MORSHU_WEAPONS = preload("uid://ds8fpl8lnis2w")
const PLAYER_STAT_CONTAINER = preload("uid://q7bd6dgg8c8b")

@onready var wsc_box: HBoxContainer = $TabContainer/Shop/MarginContainer/HBoxContainer/VBoxContainer/PanelContainer/MarginContainer/WSCBox
@onready var isc_box: HBoxContainer = $TabContainer/Shop/MarginContainer/HBoxContainer/VBoxContainer/PanelContainer2/MarginContainer/ISCBox
@onready var scene_loader: SceneLoader = $SceneLoader
@onready var video_stream_player: VideoStreamPlayer = $TabContainer/Shop/MarginContainer/HBoxContainer/VBoxContainer2/PanelContainer/MarginContainer/VideoStreamPlayer
@onready var weapon_image: TextureRect = $WeaponImage
@onready var ps_container: VBoxContainer = $TabContainer/Shop/MarginContainer/HBoxContainer/VBoxContainer2/HBoxContainer/PanelContainer/MarginContainer/PSContainer

func _ready():
	GlobalSignals.thing_bought.connect(_thing_bought)
	GlobalSignals.cant_afford.connect(_cant_afford)
	GlobalSignals.wi_weapon_grabbed.connect(_wi_weapon_grabbed)
	GlobalSignals.wi_weapon_dropped.connect(_wi_weapon_dropped)
	
	_create_stats()
	_choose_weapons()
	_choose_items()

func _choose_weapons():
	for i in wsc_box.get_children():
		i.queue_free()
	
	for i in range(4):
		var w = WEAPON_SHOP_CONTAINER.instantiate()
		w.data = Weapons.choose_weapon()
		while w.data == null:
			w.data = Weapons.choose_weapon()
		wsc_box.add_child(w)

func _choose_items():
	for i in isc_box.get_children():
		i.queue_free()
	
	for i in range(4):
		var ic = ITEM_SHOP_CONTAINER.instantiate()
		ic.data = Items.choose_item()
		while ic.data == null:
			ic.data = Items.choose_item()
		isc_box.add_child(ic)

func _process(delta: float) -> void:
	weapon_image.global_position = get_global_mouse_position()

func _thing_bought(what):
	if what is ItemData:
		PlayerStats.health.plus_equals(what.health)
		PlayerStats.health_regeneration.plus_equals(what.health_regeneration)
		PlayerStats.damage_percent.plus_equals(what.damage_percent)
		PlayerStats.attack_speed_percent += what.attack_speed_percent
		PlayerStats.speed_percent += what.speed_percent
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
	if what:
		weapon_image.texture = what.weapon_portrait
		weapon_image.show()

func _wi_weapon_dropped(what: WeaponData, slot: int, target_slot: int):
	weapon_image.hide()
	if slot != target_slot:
		Globals.swap_weapons(slot, target_slot)

func _on_weapon_reroll_pressed() -> void:
	_choose_weapons()

func _create_stats():
	for i in PlayerStats.stats.keys():
		var p = PLAYER_STAT_CONTAINER.instantiate()
		ps_container.add_child(p)
		p.stat_name = i
