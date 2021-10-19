extends Control

onready var new_game = $options/new_game
onready var settings = $options/settings
onready var quit = $options/quit

func _ready() -> void:
	if OS.get_name() == "HTML5":
		quit.visible = false
	if new_game.connect("pressed", self, "_on_new_game_pressed") != OK:
		push_error("button connect fail")
	if settings.connect("pressed", self, "_on_settings_pressed") != OK:
		push_error("button connect fail")
	if quit.connect("pressed", self, "_on_quit_pressed") != OK:
		push_error("button connect fail")

func _on_new_game_pressed() -> void:
	PlayerData.current_level = 0
	PlayerData.tags_completed = 0
	if get_tree().change_scene("res://src/endings/ending.tscn") != OK:
		push_error("failed to start game")

func _on_settings_pressed() -> void:
	$settings.visible = true

func _on_quit_pressed() -> void:
	get_tree().quit()
