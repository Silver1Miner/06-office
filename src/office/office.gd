extends Node2D

var not_in_screen := true # false if in screen
onready var screen = $screen
onready var player = $Player

func _ready() -> void:
	if player.connect("enter_screen", self, "_on_screen_enter") != OK:
		push_error("signal connect fail")
	if screen.connect("exit_screen", self, "_on_screen_exit") != OK:
		push_error("signal connect fail")

func _on_screen_enter() -> void:
	print("screen entered")
	not_in_screen = false
	screen.visible = true
	screen.active = true
	player.active = false

func _on_screen_exit() -> void:
	print("screen exited")
	not_in_screen = true
	screen.active = false
	screen.visible = false
	player.active = true
