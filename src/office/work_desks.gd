extends TextureRect

#onready var screen = $screen

func _ready() -> void:
	if $to_computer.connect("meter_full", self, "_on_screen_enter") != OK:
		push_error("signal connect fail")
	if $to_hallway.connect("meter_full", self, "_go_to_hallway") != OK:
		push_error("signal connect fail")
	#if screen.connect("exit_screen", self, "_on_screen_exit") != OK:
	#	push_error("signal connect fail")
	$textbox.initialize(["My work area"])

func _on_screen_enter() -> void:
	#print("screen entered from work desks")
	#$textbox.visible = false
	#screen.visible = true
	#screen.active = true
	if get_tree().change_scene_to(PlayerData.screen) != OK:
		push_error("fail to change scene to screen")

func _on_screen_exit() -> void:
	#print("screen exited")
	$textbox.visible = true
	#screen.active = false
	#screen.visible = false

func _go_to_hallway() -> void:
	if get_tree().change_scene_to(PlayerData.hallway_dir) != OK:
		push_error("fail to change scene to hallway")
