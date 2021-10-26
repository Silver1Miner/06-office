extends Control

func _ready() -> void:
	if $to_hallway.connect("meter_full", self, "_go_to_hallway") != OK:
		push_error("signal connect fail")
	if $to_desk_drawer.connect("meter_full", self, "_go_to_drawer") != OK:
		push_error("signal connect fail")
	if PlayerData.has_key and !PlayerData.has_gaslight:
		$to_desk_drawer.visible = true
	else:
		$to_desk_drawer.visible = false
	$textbox.initialize(["The manager's office. The manager is never out."])

func _go_to_hallway() -> void:
	if get_tree().change_scene_to(PlayerData.hallway_dir) != OK:
		push_error("fail to change scene to hallway")

func _go_to_drawer() -> void:
	if get_tree().change_scene_to(PlayerData.drawer_dir) != OK:
		push_error("fail to change scene to drawer")
