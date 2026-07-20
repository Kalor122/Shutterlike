extends Label

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func display(display_text: String):
	text = display_text
	animation_player.play("new_animation")
