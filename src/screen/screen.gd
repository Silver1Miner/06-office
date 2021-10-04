extends Control

var LEFT_LIMIT = 60
var RIGHT_LIMIT = 580
var TOP_LIMIT = 60
var BOTTOM_LIMIT = 340
var capture_mouse := true
onready var icon = $screen/icon
onready var progress = $TextureProgress
var arrow = load("res://assets/screen/click.png")
signal exited_screen

func _ready() -> void:
	if icon.connect("icon_pressed", self, "_on_icon_pressed") != OK:
		push_error("signal connect fail")

func _on_icon_pressed(identity: String) -> void:
	print(identity + " icon pressed")

func _process(_delta: float) -> void:
	if Input.is_key_pressed(KEY_R):
		progress.value += 1
		if progress.value == 100:
			emit_signal("exited_screen")
			visible = false
			progress.value = 0
	if get_global_mouse_position().x > LEFT_LIMIT \
	 and get_global_mouse_position().x < RIGHT_LIMIT \
	 and get_global_mouse_position().y < BOTTOM_LIMIT \
	 and get_global_mouse_position().y > TOP_LIMIT:
		Input.set_custom_mouse_cursor(arrow)
	else:
		Input.set_custom_mouse_cursor(null)
	#if capture_mouse:
	#	if get_global_mouse_position().x < LEFT_LIMIT:
	#		warp_mouse(Vector2(LEFT_LIMIT, get_global_mouse_position().y))
	#	elif get_global_mouse_position().x > RIGHT_LIMIT:
	#		warp_mouse(Vector2(RIGHT_LIMIT, get_global_mouse_position().y))
	#	if get_global_mouse_position().y > BOTTOM_LIMIT:
	#		warp_mouse(Vector2(get_global_mouse_position().x, BOTTOM_LIMIT))
	#	elif get_global_mouse_position().y < TOP_LIMIT:
	#		warp_mouse(Vector2(get_global_mouse_position().x, TOP_LIMIT))
