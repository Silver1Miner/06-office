extends TextureRect

onready var screen = $screen

func _ready() -> void:
	if $to_computer.connect("meter_full", self, "_on_screen_enter") != OK:
		push_error("signal connect fail")
	if $to_hallway.connect("meter_full", self, "_go_to_hallway") != OK:
		push_error("signal connect fail")
	if screen.connect("exit_screen", self, "_on_screen_exit") != OK:
		push_error("signal connect fail")
	$textbox.initialize({"0":{"text":"My work area"}})

func _on_screen_enter() -> void:
	yield(get_tree().create_timer(PlayerData.screen_wait_time), "timeout")
	print("screen entered from work desks")
	screen.update_display()
	screen.visible = true
	screen.active = true

func _on_screen_exit() -> void:
	yield(get_tree().create_timer(PlayerData.screen_wait_time), "timeout")
	print("screen exited")
	screen.active = false
	screen.visible = false

func _go_to_hallway() -> void:
	if get_tree().change_scene(PlayerData.hallway_dir) != OK:
		push_error("fail to change scene to hallway")
