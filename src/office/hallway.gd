extends TextureRect

signal go_to_work_desks
onready var to_work_desks = $to_work_desks

func _ready() -> void:
	if to_work_desks.connect("meter_full", self, "_go_to_desks") != OK:
		push_error("signal connect fail")

func _go_to_desks() -> void:
	emit_signal("go_to_work_desks")
