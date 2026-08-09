extends Node

var weapon_list = [
	load("uid://c3nrx4k5j8x35"),
	load("uid://cttxjglx1h1v1"),
	load("uid://c01uhpbha1s5f"),
	load("uid://bsbfvb8gebf10"),
	load("uid://cu7h3xrtf3540"),
	load("uid://bukwr2yihji86"),
	load("uid://ct4wfyu5j2xut"),
	load("uid://bt3tqn5ukq6tm"),
	load("uid://c01spn1mlse78"),
]

func get_weapon_by_id(id: int):
	for i in weapon_list:
		if i.weapon_id == id:
			return i

func get_weapon_by_name(w_name: String):
	for i in weapon_list:
		if i is WeaponData:
			if i.weapon_name == w_name:
				return i

func get_weapon_on_slot(slot: int):
	return Globals.bought_weapons[slot]

func choose_weapon():
	var w = weapon_list.pick_random()
	print(w.weapon_rarity)
	if Globals.chance(w.weapon_rarity):
		print("choosen: ", w.weapon_rarity)
		return w
	else:
		return null
