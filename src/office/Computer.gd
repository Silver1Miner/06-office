extends Sprite

export var computer_id := 2
onready var on_button = $SwitchCommand

signal enter_screen(computer_id)

func _ready() -> void:
	if on_button.connect("meter_full", self, "_on_meter_full") != OK:
		push_error("signal connect fail")
	on_button.change_label("HOLD to access Computer " + str(computer_id))

func get_computer_id() -> int:
	return computer_id

func _on_meter_full() -> void:
	emit_signal("enter_screen", computer_id)
