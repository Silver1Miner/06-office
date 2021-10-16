extends ColorRect

func _ready() -> void:
	visible = false

func _input(event) -> void:
	if event.is_action_pressed("ui_pause"):
		if get_tree().paused:
			get_tree().paused = false
			visible = false
		else:
			get_tree().paused = true
			visible = true

func _on_Menu_pressed() -> void:
	get_tree().paused = false
	if get_tree().change_scene_to(PlayerData.main_menu) != OK:
		push_error("fail to switch to main menu")

func _on_Close_pressed() -> void:
	get_tree().paused = false
	visible = false
