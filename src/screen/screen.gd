extends Control

var active = false
var current_computer = 0

var LEFT_LIMIT = 60
var RIGHT_LIMIT = 580
var TOP_LIMIT = 60
var BOTTOM_LIMIT = 340
var capture_mouse := true
onready var progress = $TextureProgress
var arrow = load("res://assets/screen/click.png")
signal exit_screen

func _ready() -> void:
	for icon in $screen.get_children():
		if icon.connect("icon_pressed", self, "_on_icon_pressed") != OK:
			push_error("signal connect fail")

func update_display() -> void:
	$computer_number.text = "# " + str(current_computer)

func _on_icon_pressed(identity: String) -> void:
	print(identity + " icon pressed")

var new_hold = false
func _process(_delta: float) -> void:
	if active:
		if Input.is_action_pressed("use") and new_hold:
				progress.value += PlayerData.screen_switch_speed
				if progress.value == 100:
					progress.value = 0
					active = false
					emit_signal("exit_screen")
		elif Input.is_action_just_pressed("use"):
					new_hold = true
		elif Input.is_action_just_released("use"):
			progress.value = 0
	if get_global_mouse_position().x > LEFT_LIMIT \
	 and get_global_mouse_position().x < RIGHT_LIMIT \
	 and get_global_mouse_position().y < BOTTOM_LIMIT \
	 and get_global_mouse_position().y > TOP_LIMIT:
		Input.set_custom_mouse_cursor(arrow)
	else:
		Input.set_custom_mouse_cursor(null)
