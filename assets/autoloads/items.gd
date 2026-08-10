extends Node

var item_list = [
	load("uid://dhpn20xekek1n"),
	load("uid://bhb060e7y7wf2"),
	load("uid://1s0j1kxx85bt"),
	load("uid://cvq8vst05xofn"),
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
