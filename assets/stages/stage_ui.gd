extends CanvasLayer

var stage: Stage

@onready var time: Label = $Control/Time
@onready var round_zone: Label = $Control/RoundZone
@onready var cash: Label = $Control/VBoxContainer/Cash
@onready var health: ProgressBar = $Control/VBoxContainer/Health
@onready var animation_player: AnimationPlayer = $HBoxContainer/AnimationPlayer
@onready var health_label: Label = $Control/VBoxContainer/Health/Label

func _ready() -> void:
	stage = get_parent()

func _process(delta: float) -> void:
	round_zone.text = "Round: {0} - Zone: {1}".format([Globals.round, Globals.zone])
	time.text = str(stage.time)
	cash.text = "Cash: {0}".format([Globals.format(Globals.rupies)])
	health.max_value = PlayerStats.health.to_float()
	health.value = stage.player.health.to_float()
	health_label.text = "{0}/{1}".format([Globals.format(health.value), Globals.format(health.max_value)])
