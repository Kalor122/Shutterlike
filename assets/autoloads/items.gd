extends Node

var item_list = [
	load("uid://bcyer2tev8baw")
]

func choose_item():
	var i = item_list.pick_random()
	print(i.item_rarity)
	if Globals.chance(i.item_rarity):
		print("choosen: ", i.item_rarity)
		return i
	else:
		return null
