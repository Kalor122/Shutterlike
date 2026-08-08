extends PanelContainer

const WEAPON_TOOLTIP = preload("uid://bl8iqg2wwr4a4")

var data: WeaponData
@onready var texture_rect: TextureRect = $MarginContainer/TextureRect

@export var slot: int = 0
var grab = false

var w_tooltip

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

func _create_tooltip():
	var w = WEAPON_TOOLTIP.instantiate()
	w.data = data
	w.slot = slot
	w_tooltip = w
	if not get_tree().current_scene is Stage:
		get_tree().current_scene.add_child(w_tooltip)
	else:
		get_tree().current_scene.stage_ui.add_child(w_tooltip)
	w_tooltip.hide()

func _delete_tooltip():
	if w_tooltip:
		w_tooltip.queue_free()
	w_tooltip = null

func _on_texture_rect_mouse_entered() -> void:
	if w_tooltip:
		w_tooltip.should_hide.emit(false)

func _on_texture_rect_mouse_exited() -> void:
	if w_tooltip:
		w_tooltip.should_hide.emit(true)
