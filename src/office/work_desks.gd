extends TextureRect
# WORK DESKS

signal go_to_hallway
onready var screen = $screen
onready var to_computer = $to_computer
onready var to_hallway = $to_hallway

func _ready() -> void:
	if to_computer.connect("meter_full", self, "_on_screen_enter") != OK:
		push_error("signal connect fail")
	if to_hallway.connect("meter_full", self, "_go_to_hallway") != OK:
		push_error("signal connect fail")
	if screen.connect("exit_screen", self, "_on_screen_exit") != OK:
		push_error("signal connect fail")

func _on_screen_enter() -> void:
	print("screen entered from work desks")
	screen.update_display()
	screen.visible = true
	screen.active = true

func _on_screen_exit() -> void:
	print("screen exited")
	screen.active = false
	screen.visible = false

func _go_to_hallway() -> void:
	emit_signal("go_to_hallway")
