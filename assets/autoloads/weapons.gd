extends Node

var weapon_list = [
	"uid://c3nrx4k5j8x35",
	"uid://cttxjglx1h1v1",
	"uid://c01uhpbha1s5f",
]

func get_weapon_by_id(id: int):
	for i in weapon_list:
		if load(i).weapon_id == id:
			return load(i)

func choose_weapon():
	return load(weapon_list.pick_random())
