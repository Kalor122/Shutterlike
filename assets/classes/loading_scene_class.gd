extends CanvasLayer
class_name LoadingScene

@onready var progress_bar: ProgressBar = $ProgressBar

func on_progress_changed(new_value: float):
	progress_bar.value = new_value

func on_load_finished():
	pass

func _on_timer_timeout() -> void:
	progress_bar.show()
