extends Control

var number = 1000000
var form = Formatter.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.text = form.format(number)
