extends Control

var not_in_screen := true # false if in screen
onready var screen = $screen
onready var computer = $Computer
onready var textbox = $textbox

func _ready() -> void:
	if computer.connect("enter_screen", self, "_on_screen_enter") != OK:
		push_error("signal connect fail")
	if screen.connect("exit_screen", self, "_on_screen_exit") != OK:
		push_error("signal connect fail")

func play_textbox(text) -> void:
	textbox.initialize(text)

func _on_screen_enter(current_computer) -> void:
	print("screen entered at computer ", current_computer)
	textbox.end_text()
	screen.current_computer = current_computer
	screen.update_display()
	not_in_screen = false
	screen.visible = true
	screen.active = true

func _on_screen_exit() -> void:
	print("screen exited")
	not_in_screen = true
	screen.active = false
	screen.visible = false
