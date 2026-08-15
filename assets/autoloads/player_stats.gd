extends Node

var health: BigNumber = BigNumber.new()
var health_regeneration: BigNumber = BigNumber.new()
var damage_multiplier: float = 1.000
var attack_speed: int = 0
var speed: int = 0
var armour: int = 0

var stats = {
	"Health": health,
	"Health Regeneration": health_regeneration,
	"Damage Mult": damage_multiplier,
	"Attack Speed": attack_speed,
	"Speed": speed,
	"Armour": armour,
}

func _ready() -> void:
	health.mantissa = 0
	health.exponent = 0
	health.plus_equals(15)

func _process(delta: float) -> void:
	stats["Health"] = health
	stats["Health Regeneration"] = health_regeneration
	stats["Damage Mult"] = Globals.round_to_dec(damage_multiplier, 3)
	stats["Attack Speed"] = attack_speed
	stats["Speed"] = speed
	stats["Armour"] = armour
	
	if damage_multiplier >= 999999999999999950000000000000000.0:
		damage_multiplier = 999999999999999950000000000000000.0
