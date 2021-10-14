extends Control

var next_level := "res://src/menu/main_menu.tscn"
onready var textbox = $textbox

func _ready() -> void:
	textbox.timer.wait_time = 0.1
	if PlayerData.current_level == 1:
		next_level = "res://src/office/lobby.tscn"
		textbox.initialize(intro_text)
	else:
		match PlayerData.ending:
			0:
				textbox.initialize(ending_1)

func _on_Next_pressed() -> void:
	if get_tree().change_scene(next_level) != OK:
		push_error("fail to change scene")

var intro_text = {
	"0": {
		"text": "This is a placeholder!"
	},
}

var intro_text_2 = {
	"0": {}
}

var ending_1 = {
	"0": {
		"text":
"""GOOD ENDING

Congratulations on a hard day's work.

Because of your loyal service, the company is proud to award you with a promotion.
"""
	}
}
