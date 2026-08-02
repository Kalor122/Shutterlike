extends Resource
class_name EntityEffectData

@export var effect_id: int
@export var effect_name: String
@export_multiline() var effect_description: String
@export var effect_image: CompressedTexture2D
@export var max_stack: float
@export_file_path("*.tscn") var scene_path: String
