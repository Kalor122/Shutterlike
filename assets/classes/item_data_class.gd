extends Resource
class_name ItemData

@export var item_id: int
@export var item_name: String
@export var item_portrait: CompressedTexture2D
@export var item_rarity: Globals.Rarities
@export var price: float
@export_file_path("*.tscn") var scene_path: String

@export_group("Player Stats")
@export var health: float
@export var health_regeneration: float
@export var damage_percent: float
@export var attack_speed_percent: float
@export var speed_percent: float

var big_price: BigNumber = BigNumber.new()

func calculate_money():
	big_price.mantissa = 0
	big_price.exponent = 0
	
	big_price.plus_equals(price * Globals.global_item_price_mult)
