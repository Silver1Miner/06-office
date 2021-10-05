extends Control

var active = false
var LEFT_LIMIT = 60
var RIGHT_LIMIT = 580
var TOP_LIMIT = 60
var BOTTOM_LIMIT = 340
var capture_mouse := true
onready var icon = $screen/icon
onready var progress = $TextureProgress
var arrow = load("res://assets/screen/click.png")
signal exit_screen

func _ready() -> void:
	if icon.connect("icon_pressed", self, "_on_icon_pressed") != OK:
		push_error("signal connect fail")

func _on_icon_pressed(identity: String) -> void:
	print(identity + " icon pressed")

func _process(_delta: float) -> void:
	if active and Input.is_key_pressed(KEY_R):
		progress.value += 1
		if progress.value == 100:
			progress.value = 0
			active = false
			emit_signal("exit_screen")
	else:
		progress.value = 0
	if get_global_mouse_position().x > LEFT_LIMIT \
	 and get_global_mouse_position().x < RIGHT_LIMIT \
	 and get_global_mouse_position().y < BOTTOM_LIMIT \
	 and get_global_mouse_position().y > TOP_LIMIT:
		Input.set_custom_mouse_cursor(arrow)
	else:
		Input.set_custom_mouse_cursor(null)
