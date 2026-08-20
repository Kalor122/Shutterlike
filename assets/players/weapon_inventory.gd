extends PanelContainer

@onready var wi_container: PanelContainer = $MarginContainer/HBoxContainer/WIContainer
@onready var wi_container_2: PanelContainer = $MarginContainer/HBoxContainer/WIContainer2
@onready var wi_container_3: PanelContainer = $MarginContainer/HBoxContainer/WIContainer3
@onready var wi_container_4: PanelContainer = $MarginContainer/HBoxContainer/WIContainer4
@onready var wi_container_5: PanelContainer = $MarginContainer/HBoxContainer/WIContainer5
@onready var wi_container_6: PanelContainer = $MarginContainer/HBoxContainer/WIContainer6
@onready var wi_container_7: PanelContainer = $MarginContainer/HBoxContainer/WIContainer7
@onready var wi_container_8: PanelContainer = $MarginContainer/HBoxContainer/WIContainer8

var is_grab = false

var empty_color = Color(1.0, 1.0, 1.0, 0.392)

func _ready() -> void:
	GlobalSignals.wi_weapon_grabbed.connect(_wi_weapon_grabbed)
	GlobalSignals.wi_weapon_dropped.connect(_wi_weapon_dropped)

func _process(delta: float) -> void:
	if Globals.bought_weapons[0] != null:
		wi_container.data = Globals.bought_weapons[0]
		match Globals.bought_weapons[0].weapon_rarity:
			Globals.Rarities.COMMON:
				wi_container.self_modulate = Color(0.25, 0.34, 0.218, 1.0)
				wi_container.material = null
			Globals.Rarities.RARE:
				wi_container.self_modulate = Color(0.267, 0.218, 0.34, 1.0)
				wi_container.material = null
			Globals.Rarities.EPIC:
				wi_container.self_modulate = Color(0.34, 0.218, 0.218, 1.0)
				wi_container.material = null
			Globals.Rarities.GODLIKE:
				wi_container.self_modulate = Color(1.0, 1.0, 1.0, 1.0)
				wi_container.material = ShaderMaterial.new()
				wi_container.material.shader = load("uid://248k74bv46yk")
	else:
		wi_container.data = null
		wi_container.material = null
		wi_container._delete_tooltip()
		wi_container.self_modulate = empty_color
	
	if Globals.bought_weapons[1] != null:
		wi_container_2.data = Globals.bought_weapons[1]
		match Globals.bought_weapons[1].weapon_rarity:
			Globals.Rarities.COMMON:
				wi_container_2.self_modulate = Color(0.25, 0.34, 0.218, 1.0)
				wi_container_2.material = null
			Globals.Rarities.RARE:
				wi_container_2.self_modulate = Color(0.267, 0.218, 0.34, 1.0)
				wi_container_2.material = null
			Globals.Rarities.EPIC:
				wi_container_2.self_modulate = Color(0.34, 0.218, 0.218, 1.0)
				wi_container_2.material = null
			Globals.Rarities.GODLIKE:
				wi_container_2.self_modulate = Color(1.0, 1.0, 1.0, 1.0)
				wi_container_2.material = ShaderMaterial.new()
				wi_container_2.material.shader = load("uid://248k74bv46yk")
	else:
		wi_container_2.data = null
		wi_container_2.material = null
		wi_container_2._delete_tooltip()
		wi_container_2.self_modulate = empty_color
	
	if Globals.bought_weapons[2] != null:
		wi_container_3.data = Globals.bought_weapons[2]
		match Globals.bought_weapons[2].weapon_rarity:
			Globals.Rarities.COMMON:
				wi_container_3.self_modulate = Color(0.25, 0.34, 0.218, 1.0)
				wi_container_3.material = null
			Globals.Rarities.RARE:
				wi_container_3.self_modulate = Color(0.267, 0.218, 0.34, 1.0)
				wi_container_3.material = null
			Globals.Rarities.EPIC:
				wi_container_3.self_modulate = Color(0.34, 0.218, 0.218, 1.0)
				wi_container_3.material = null
			Globals.Rarities.GODLIKE:
				wi_container_3.self_modulate = Color(1.0, 1.0, 1.0, 1.0)
				wi_container_3.material = ShaderMaterial.new()
				wi_container_3.material.shader = load("uid://248k74bv46yk")
	else:
		wi_container_3.data = null
		wi_container_3.material = null
		wi_container_3._delete_tooltip()
		wi_container_3.self_modulate = empty_color
	
	if Globals.bought_weapons[3] != null:
		wi_container_4.data = Globals.bought_weapons[3]
		match Globals.bought_weapons[3].weapon_rarity:
			Globals.Rarities.COMMON:
				wi_container_4.self_modulate = Color(0.25, 0.34, 0.218, 1.0)
				wi_container_4.material = null
			Globals.Rarities.RARE:
				wi_container_4.self_modulate = Color(0.267, 0.218, 0.34, 1.0)
				wi_container_4.material = null
			Globals.Rarities.EPIC:
				wi_container_4.self_modulate = Color(0.34, 0.218, 0.218, 1.0)
				wi_container_4.material = null
			Globals.Rarities.GODLIKE:
				wi_container_4.self_modulate = Color(1.0, 1.0, 1.0, 1.0)
				wi_container_4.material = ShaderMaterial.new()
				wi_container_4.material.shader = load("uid://248k74bv46yk")
	else:
		wi_container_4.data = null
		wi_container_4.material = null
		wi_container_4._delete_tooltip()
		wi_container_4.self_modulate = empty_color
	
	if Globals.bought_weapons[4] != null:
		wi_container_5.data = Globals.bought_weapons[4]
		match Globals.bought_weapons[4].weapon_rarity:
			Globals.Rarities.COMMON:
				wi_container_5.self_modulate = Color(0.25, 0.34, 0.218, 1.0)
				wi_container_5.material = null
			Globals.Rarities.RARE:
				wi_container_5.self_modulate = Color(0.267, 0.218, 0.34, 1.0)
				wi_container_5.material = null
			Globals.Rarities.EPIC:
				wi_container_5.self_modulate = Color(0.34, 0.218, 0.218, 1.0)
				wi_container_5.material = null
			Globals.Rarities.GODLIKE:
				wi_container_5.self_modulate = Color(1.0, 1.0, 1.0, 1.0)
				wi_container_5.material = ShaderMaterial.new()
				wi_container_5.material.shader = load("uid://248k74bv46yk")
	else:
		wi_container_5.data = null
		wi_container_5.material = null
		wi_container_5._delete_tooltip()
		wi_container_5.self_modulate = empty_color
	
	if Globals.bought_weapons[5] != null:
		wi_container_6.data = Globals.bought_weapons[5]
		match Globals.bought_weapons[5].weapon_rarity:
			Globals.Rarities.COMMON:
				wi_container_6.self_modulate = Color(0.25, 0.34, 0.218, 1.0)
				wi_container_6.material = null
			Globals.Rarities.RARE:
				wi_container_6.self_modulate = Color(0.267, 0.218, 0.34, 1.0)
				wi_container_6.material = null
			Globals.Rarities.EPIC:
				wi_container_6.self_modulate = Color(0.34, 0.218, 0.218, 1.0)
				wi_container_6.material = null
			Globals.Rarities.GODLIKE:
				wi_container_6.self_modulate = Color(1.0, 1.0, 1.0, 1.0)
				wi_container_6.material = ShaderMaterial.new()
				wi_container_6.material.shader = load("uid://248k74bv46yk")
	else:
		wi_container_6.data = null
		wi_container_6.material = null
		wi_container_6._delete_tooltip()
		wi_container_6.self_modulate = empty_color
	
	if Globals.bought_weapons[6] != null:
		wi_container_7.data = Globals.bought_weapons[6]
		match Globals.bought_weapons[6].weapon_rarity:
			Globals.Rarities.COMMON:
				wi_container_7.self_modulate = Color(0.25, 0.34, 0.218, 1.0)
				wi_container_7.material = null
			Globals.Rarities.RARE:
				wi_container_7.self_modulate = Color(0.267, 0.218, 0.34, 1.0)
				wi_container_7.material = null
			Globals.Rarities.EPIC:
				wi_container_7.self_modulate = Color(0.34, 0.218, 0.218, 1.0)
				wi_container_7.material = null
			Globals.Rarities.GODLIKE:
				wi_container_7.self_modulate = Color(1.0, 1.0, 1.0, 1.0)
				wi_container_7.material = ShaderMaterial.new()
				wi_container_7.material.shader = load("uid://248k74bv46yk")
	else:
		wi_container_7.data = null
		wi_container_7.material = null
		wi_container_7._delete_tooltip()
		wi_container_7.self_modulate = empty_color
	
	if Globals.bought_weapons[7] != null:
		wi_container_8.data = Globals.bought_weapons[7]
		match Globals.bought_weapons[7].weapon_rarity:
			Globals.Rarities.COMMON:
				wi_container_8.self_modulate = Color(0.25, 0.34, 0.218, 1.0)
				wi_container_8.material = null
			Globals.Rarities.RARE:
				wi_container_8.self_modulate = Color(0.267, 0.218, 0.34, 1.0)
				wi_container_8.material = null
			Globals.Rarities.EPIC:
				wi_container_8.self_modulate = Color(0.34, 0.218, 0.218, 1.0)
				wi_container_8.material = null
			Globals.Rarities.GODLIKE:
				wi_container_8.self_modulate = Color(1.0, 1.0, 1.0, 1.0)
				wi_container_8.material = ShaderMaterial.new()
				wi_container_8.material.shader = load("uid://248k74bv46yk")
	else:
		wi_container_8.data = null
		wi_container_8.material = null
		wi_container_8._delete_tooltip()
		wi_container_8.self_modulate = empty_color

func _wi_weapon_grabbed(what: WeaponData):
	is_grab = true
	wi_container._delete_tooltip()
	wi_container_2._delete_tooltip()
	wi_container_3._delete_tooltip()
	wi_container_4._delete_tooltip()
	wi_container_5._delete_tooltip()
	wi_container_6._delete_tooltip()
	wi_container_7._delete_tooltip()
	wi_container_8._delete_tooltip()

func _wi_weapon_dropped(what: WeaponData, slot: int, target_slot: int):
	is_grab = false
