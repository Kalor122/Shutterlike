extends Resource
class_name ItemData

@export var item_id: int
@export var item_name: String
@export var item_portrait: CompressedTexture2D
@export var item_rarity: Globals.Rarities
@export_multiline() var item_description: String
@export var price: float
@export_file_path("*.tscn") var scene_path: String

@export_group("Player Stats")
@export var health: float
@export_enum("Sum", "Sub", "Mult", "Div", "Pow") var h_equation: int
@export var health_regeneration: float
@export_enum("Sum", "Sub", "Mult", "Div", "Pow") var hr_equation: int
@export var damage_multiplier: float
@export_enum("Sum", "Sub", "Mult", "Div", "Pow") var dm_equation: int
@export var attack_speed: int
@export_enum("Sum", "Sub", "Mult", "Div", "Pow") var as_equation: int
@export var speed: int
@export_enum("Sum", "Sub", "Mult", "Div", "Pow") var s_equation: int

var big_price: BigNumber = BigNumber.new()

func calculate_money():
	big_price.mantissa = 0
	big_price.exponent = 0
	
	big_price.plus_equals(price * Globals.global_item_price_mult)
