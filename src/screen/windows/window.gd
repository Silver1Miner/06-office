extends ColorRect
class_name Window

onready var close = $close

func _ready() -> void:
	if close.connect("pressed", self, "_on_close") != OK:
		push_error("close button connect fail")

func _on_close() -> void:
	Music.play_effect(2)
	visible = false
