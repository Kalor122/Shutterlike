extends PanelContainer

var data: WeaponData
@onready var texture_rect: TextureRect = $MarginContainer/TextureRect

@export var slot: int = 0
var grab = false

func _process(delta: float) -> void:
	if data:
		texture_rect.texture = data.weapon_portrait
	else:
		texture_rect.texture = null
	
	if grab:
		texture_rect.modulate.a8 = 100
	else:
		texture_rect.modulate.a8 = 255

func _on_texture_rect_gui_input(event: InputEvent) -> void:
	if not get_tree().current_scene is Stage:
		if event is InputEventMouseButton:
			if event.button_index == 1:
				if event.pressed:
					grab = true
					GlobalSignals.wi_weapon_grabbed.emit(data)
				else:
					grab = false
					GlobalSignals.wi_weapon_dropped.emit(data, slot, Globals.wi_container_hovered)

func _on_mouse_entered() -> void:
	Globals.wi_container_hovered = slot
