extends PanelContainer

const WEAPON_TOOLTIP = preload("uid://bl8iqg2wwr4a4")

var data: WeaponData
@onready var texture_rect: TextureRect = $MarginContainer/TextureRect

@export var slot: int = 0
var grab = false

var w_tooltip

var being_sold = false

func _ready() -> void:
	GlobalSignals.sell_weapon.connect(_sell_weapon)

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
			elif event.button_index == 2:
				if event.pressed:
					GlobalSignals.sell_weapon.emit(slot)
					being_sold = true

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

func _delete_tooltip():
	if w_tooltip:
		w_tooltip.queue_free()
	w_tooltip = null

func _on_texture_rect_mouse_entered() -> void:
	_create_tooltip()

func _on_texture_rect_mouse_exited() -> void:
	_delete_tooltip()

func _sell_weapon(w_slot: int):
	if not being_sold:
		if w_slot == slot:
			if data:
				Globals.rupies.plus_equals(Globals.get_percentage(data.price, 55))
				var m = ShaderMaterial.new()
				m.shader = load("uid://bfe60euusnxx2")
				m.set_shader_parameter("progress", -1.0)
				m.set_shader_parameter("width", 0.829)
				var noise = NoiseTexture2D.new()
				noise.noise = FastNoiseLite.new()
				m.set_shader_parameter("noise", noise)
				m.set_shader_parameter("colorCurve", load("uid://cprhvq22kmheq"))
				m.set_shader_parameter("timed", false)
				m.set_shader_parameter("speed", 1.0)
				m.set_shader_parameter("angle", -0.05)
				texture_rect.material = m
				var t = create_tween()
				t.tween_property(texture_rect.material, "shader_parameter/progress", 2.0, 1)
				await t.finished
				_delete_tooltip()
				texture_rect.material = null
				being_sold = false
				Globals.bought_weapons[w_slot] = null
