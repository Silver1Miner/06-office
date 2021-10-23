extends Control

func _ready() -> void:
	Music.play_sheperd()
	if $to_exit.connect("meter_full", self, "_go_to_exit") != OK:
		push_error("signal connect fail")
	if $to_lobby.connect("meter_full", self, "_go_to_lobby") != OK:
		push_error("signal connect fail")
	$textbox.initialize(["The elevator. The way in and out the office."])

func _go_to_lobby() -> void:
	Music.end_shepherd()
	if get_tree().change_scene_to(PlayerData.lobby_dir) != OK:
		push_error("fail to change scene")

func _go_to_exit() -> void:
	Music.end_shepherd()
	if get_tree().change_scene("res://src/endings/ending.tscn") != OK:
		push_error("fail to change scene")
