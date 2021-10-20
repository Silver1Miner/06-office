extends Control

var active = false
var current_computer = 0

onready var email = $email
onready var tasks = $tasks
onready var date = $calendar
onready var calc = $calculator
onready var trash = $trash
onready var switch_command = $SwitchCommand

var LEFT_LIMIT = 55
var RIGHT_LIMIT = 580
var TOP_LIMIT = 55
var BOTTOM_LIMIT = 340
var capture_mouse := true
var arrow = load("res://assets/screen/click-32.png")
#signal exit_screen

func _ready() -> void:
	$Timer.wait_time = rand_range(1, 120)
	$Timer.start()
	if switch_command.connect("meter_full", self, "_on_meter_full") != OK:
		push_error("switch connect fail")
	for icon in $screen.get_children():
		if icon.connect("icon_pressed", self, "_on_icon_pressed") != OK:
			push_error("signal connect fail")

func _on_meter_full() -> void:
	active = false
	#emit_signal("exit_screen")
	Music.play_effect(1)
	if get_tree().change_scene_to(PlayerData.work_desks_dir) != OK:
		push_error("fail to change scene to work desks")
	

func _on_icon_pressed(identity: String) -> void:
	#print(identity + " icon pressed")
	match identity:
		"MAIL":
			email.visible = true
		"TASKS":
			tasks.visible = true
		"DATE":
			date.refresh()
			date.visible = true
		"CALC":
			calc.visible = true
		"TRASH":
			trash.visible = true

func _process(_delta: float) -> void:
	if active and get_global_mouse_position().x > LEFT_LIMIT \
	 and get_global_mouse_position().x < RIGHT_LIMIT \
	 and get_global_mouse_position().y < BOTTOM_LIMIT \
	 and get_global_mouse_position().y > TOP_LIMIT:
		Input.set_custom_mouse_cursor(arrow,
			Input.CURSOR_ARROW,
			Vector2(16, 16))
	else:
		Input.set_custom_mouse_cursor(null)


func _on_Timer_timeout() -> void:
	Music.play_effect(5)
