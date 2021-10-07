extends ColorRect

onready var close = $close

func _ready() -> void:
	if close.connect("pressed", self, "_on_close") != OK:
		push_error("close button connect fail")

func _on_close() -> void:
	visible = false
