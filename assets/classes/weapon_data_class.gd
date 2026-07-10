extends Resource
class_name WeaponData

@export var weapon_name: String
@export var weapon_portrait: CompressedTexture2D ##Should be a 600x600 PNG file.
@export var price: float
@export var damage: float
@export_file_path("*.tscn") var scene_path: String
