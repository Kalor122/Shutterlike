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

func _ready() -> void:
	GlobalSignals.wi_weapon_grabbed.connect(_wi_weapon_grabbed)
	GlobalSignals.wi_weapon_dropped.connect(_wi_weapon_dropped)

func _process(delta: float) -> void:
	if Globals.bought_weapons[0] != null:
		wi_container.data = Globals.bought_weapons[0]
		if not is_grab:
			if wi_container.w_tooltip == null:
				wi_container._create_tooltip()
	else:
		wi_container.data = null
		wi_container._delete_tooltip()
	
	if Globals.bought_weapons[1] != null:
		wi_container_2.data = Globals.bought_weapons[1]
		if not is_grab:
			if wi_container_2.w_tooltip == null:
				wi_container_2._create_tooltip()
	else:
		wi_container_2.data = null
		wi_container_2._delete_tooltip()
	
	if Globals.bought_weapons[2] != null:
		wi_container_3.data = Globals.bought_weapons[2]
		if not is_grab:
			if wi_container_3.w_tooltip == null:
				wi_container_3._create_tooltip()
	else:
		wi_container_3.data = null
		wi_container_3._delete_tooltip()
	
	if Globals.bought_weapons[3] != null:
		wi_container_4.data = Globals.bought_weapons[3]
		if not is_grab:
			if wi_container_4.w_tooltip == null:
				wi_container_4._create_tooltip()
	else:
		wi_container_4.data = null
		wi_container_4._delete_tooltip()
	
	if Globals.bought_weapons[4] != null:
		wi_container_5.data = Globals.bought_weapons[4]
		if not is_grab:
			if wi_container_5.w_tooltip == null:
				wi_container_5._create_tooltip()
	else:
		wi_container_5.data = null
		wi_container_5._delete_tooltip()
	
	if Globals.bought_weapons[5] != null:
		wi_container_6.data = Globals.bought_weapons[5]
		if not is_grab:
			if wi_container_6.w_tooltip == null:
				wi_container_6._create_tooltip()
	else:
		wi_container_6.data = null
		wi_container_6._delete_tooltip()
	
	if Globals.bought_weapons[6] != null:
		wi_container_7.data = Globals.bought_weapons[6]
		if not is_grab:
			if wi_container_7.w_tooltip == null:
				wi_container_7._create_tooltip()
	else:
		wi_container_7.data = null
		wi_container_7._delete_tooltip()
	
	if Globals.bought_weapons[7] != null:
		wi_container_8.data = Globals.bought_weapons[7]
		if not is_grab:
			if wi_container_8.w_tooltip == null:
				wi_container_8._create_tooltip()
	else:
		wi_container_8.data = null
		wi_container_8._delete_tooltip()

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
