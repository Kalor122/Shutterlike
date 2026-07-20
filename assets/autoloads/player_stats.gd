extends Node

var health: BigNumber = BigNumber.new()
var health_regeneration: BigNumber = BigNumber.new()
var damage_percent: BigNumber = BigNumber.new()
var attack_speed_percent: float = 0
var speed_percent: float = 0

var stats = {
	"Health": health,
	"Health Regeneration": health_regeneration,
	"Damage %": damage_percent,
	"Attack Speed %": attack_speed_percent,
	"Speed %": speed_percent,
}

func _ready() -> void:
	damage_percent.minus_equals(1)

func _process(delta: float) -> void:
	stats["Health"] = health
	stats["Health Regeneration"] = health_regeneration
	stats["Damage %"] = damage_percent
	stats["Attack Speed %"] = attack_speed_percent
	stats["Speed %"] = speed_percent
	
	if attack_speed_percent >= 100:
		attack_speed_percent = 100
