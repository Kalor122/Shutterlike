extends Node

func _ready() -> void:
	Console.add_command("weapon_add_id", _weapon_add_id, ["id"], 1, "Adds a weapon from given ID to your inventory.")

func _weapon_add_id(id: Variant):
	var w = Weapons.get_weapon_by_id(int(id))
	Globals.give_weapon(w)
	if get_tree().current_scene is Stage:
		get_tree().current_scene.player._create_weapons()
