extends PanelContainer

@onready var wi_container: PanelContainer = $MarginContainer/HBoxContainer/WIContainer
@onready var wi_container_2: PanelContainer = $MarginContainer/HBoxContainer/WIContainer2
@onready var wi_container_3: PanelContainer = $MarginContainer/HBoxContainer/WIContainer3
@onready var wi_container_4: PanelContainer = $MarginContainer/HBoxContainer/WIContainer4
@onready var wi_container_5: PanelContainer = $MarginContainer/HBoxContainer/WIContainer5
@onready var wi_container_6: PanelContainer = $MarginContainer/HBoxContainer/WIContainer6
@onready var wi_container_7: PanelContainer = $MarginContainer/HBoxContainer/WIContainer7
@onready var wi_container_8: PanelContainer = $MarginContainer/HBoxContainer/WIContainer8

func _process(delta: float) -> void:
	if Globals.bought_weapons[0] != null:
		wi_container.data = Globals.bought_weapons[0]
	else:
		wi_container.data = null
	
	if Globals.bought_weapons[1] != null:
		wi_container_2.data = Globals.bought_weapons[1]
	else:
		wi_container_2.data = null
	
	if Globals.bought_weapons[2] != null:
		wi_container_3.data = Globals.bought_weapons[2]
	else:
		wi_container_3.data = null
	
	if Globals.bought_weapons[3] != null:
		wi_container_4.data = Globals.bought_weapons[3]
	else:
		wi_container_4.data = null
	
	if Globals.bought_weapons[4] != null:
		wi_container_5.data = Globals.bought_weapons[4]
	else:
		wi_container_5.data = null
	
	if Globals.bought_weapons[5] != null:
		wi_container_6.data = Globals.bought_weapons[5]
	else:
		wi_container_6.data = null
	
	if Globals.bought_weapons[6] != null:
		wi_container_7.data = Globals.bought_weapons[6]
	else:
		wi_container_7.data = null
	
	if Globals.bought_weapons[7] != null:
		wi_container_8.data = Globals.bought_weapons[7]
	else:
		wi_container_8.data = null
