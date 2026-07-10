extends Resource
class_name WeaponData

@export var weapon_id: int
@export var weapon_name: String
@export var weapon_portrait: CompressedTexture2D ##Should be a 600x600 PNG file.
@export var price: float
@export var damage: float
@export var fire_rate: float
@export_file_path("*.tscn") var scene_path: String

var big_price: BigNumber = BigNumber.new()

func calculate_money():
	big_price.mantissa = 0
	big_price.exponent = 0
	
	big_price.plus_equals(price * Globals.global_weapon_price_mult)
