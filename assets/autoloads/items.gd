extends Node

var item_list = [
	load("uid://dhpn20xekek1n"),
	load("uid://bhb060e7y7wf2"),
	load("uid://1s0j1kxx85bt"),
	load("uid://cvq8vst05xofn"),
	load("uid://cpfhr3ettridc"),
	load("uid://dtiq57fn13x3r"),
	load("uid://r3cdlggiquah"),
	load("uid://b8nngo6xbhwgv"),
	load("uid://bcg71dnf3jnti"),
	load("uid://bj2il7ry2gxl4"),
	load("uid://bh5c52b7dx6rf"),
	load("uid://cldawrj3e31o1"),
	load("uid://bdrjnjdooqlve"),
	load("uid://6r3dtju0tcp8"),
	load("uid://dv1m72hishqip"),
	load("uid://bn43ixm1rafn4"),
	load("uid://d2ngvofflxsg1"),
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
