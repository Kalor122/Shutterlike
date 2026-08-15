extends PanelContainer

@onready var label_2: Label = $MarginContainer/HBoxContainer/Label2
@onready var label: Label = $MarginContainer/HBoxContainer/Label

var stat_name

func _process(delta: float) -> void:
	if PlayerStats.stats[stat_name] is BigNumber:
		label_2.text = Globals.format(PlayerStats.stats[stat_name])
	elif PlayerStats.stats[stat_name] is float:
		label_2.text = "x" + str(Globals.format(PlayerStats.stats[stat_name]))
	else:
		label_2.text = str(Globals.formatter.format(PlayerStats.stats[stat_name]))
	label.text = stat_name
