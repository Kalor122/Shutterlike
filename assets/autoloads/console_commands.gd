extends Node

func _ready() -> void:
	LimboConsole.register_command(_weapon_add_id, "weapon_add_id", "Adds a weapon with given ID.")
	LimboConsole.register_command(_weapon_add_name, "weapon_add_name", "Adds a weapon with given name.")
	LimboConsole.add_argument_autocomplete_source("weapon_add_name", 0, 
		func(): return Weapons.weapon_list.map(func(w): return w.weapon_name)
		)
	LimboConsole.register_command(_item_add_id, "item_add_id", "Adds an item with given ID.")
	LimboConsole.register_command(_item_add_name, "item_add_name", "Adds an item with given name.")
	LimboConsole.add_argument_autocomplete_source("item_add_name", 0, 
		func(): return Items.item_list.map(func(i): return i.item_name)
		)
	LimboConsole.register_command(_add_rupies, "add_rupies", "Adds rupies.")
	LimboConsole.register_command(_mult_rupies, "mult_rupies", "Multiplies rupies.")

func _add_rupies(rupies: float):
	Globals.rupies.plus_equals(rupies)

func _mult_rupies(rupies: float):
	Globals.rupies.multiply_equals(rupies)

func _weapon_add_id(id: int):
	var w = Weapons.get_weapon_by_id(id)
	Globals.give_weapon(w)
	if get_tree().current_scene is Stage:
		get_tree().current_scene.player._create_weapons()

func _weapon_add_name(w_name: String):
	var w = Weapons.get_weapon_by_name(w_name)
	Globals.give_weapon(w)
	if get_tree().current_scene is Stage:
		get_tree().current_scene.player._create_weapons()

func _item_add_id(id: int):
	var i = Items.get_item_by_id(id)
	Globals.give_item(i)
	GlobalSignals.thing_bought.emit(i)
	if get_tree().current_scene is Stage:
		get_tree().current_scene.player._create_items()

func _item_add_name(i_name: String):
	var i = Items.get_item_by_name(i_name)
	Globals.give_item(i)
	GlobalSignals.thing_bought.emit(i)
	if get_tree().current_scene is Stage:
		get_tree().current_scene.player._create_items()
