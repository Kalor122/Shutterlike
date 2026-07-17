extends CanvasLayer

var stage: Stage

@onready var time: Label = $Control/Time
@onready var round_zone: Label = $Control/RoundZone
@onready var cash: Label = $Control/Cash

func _ready() -> void:
	stage = get_parent()

func _process(delta: float) -> void:
	round_zone.text = "Round: {0} - Zone: {1}".format([Globals.round, Globals.zone])
	time.text = str(stage.time)
	cash.text = "Cash: {0}".format([Globals.format(Globals.rupies)])
