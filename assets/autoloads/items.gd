extends Node

var item_list = [
	load("uid://bcyer2tev8baw")
]

func get_item_by_id(id: int):
	for i in item_list:
		if i.item_id == id:
			return i

func get_item_by_name(i_name: String):
	for i in item_list:
		if i is ItemData:
			if i.item_name == i_name:
				return i

func choose_item():
	var i = item_list.pick_random()
	print(i.item_rarity)
	if Globals.chance(i.item_rarity):
		print("choosen: ", i.item_rarity)
		return i
	else:
		return null
