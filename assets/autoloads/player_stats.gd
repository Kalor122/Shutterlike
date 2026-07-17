extends Node

var health: BigNumber = BigNumber.new()
var health_regeneration: BigNumber = BigNumber.new()
var damage_percent: float = 100.0
var attack_speed_percent: float = 100.0
var speed_percent: float = 100.0

func _process(delta: float) -> void:
	if damage_percent <= 0.1:
		damage_percent = 0.1
	
	if attack_speed_percent <= 0.1:
		attack_speed_percent = 0.1
	
	if speed_percent <= 0.1:
		speed_percent = 0.1
