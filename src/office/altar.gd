extends TextureRect

func _ready() -> void:
	Music.play_sheperd()
	if $to_right_desks.connect("meter_full", self, "_go_to_right_desks") != OK:
		push_error("signal connect fail")
	if $sacrifice.connect("meter_full", self, "_sacrifice_ending") != OK:
		push_error("signal connect fail")
	if $flee.connect("meter_full", self, "_flee_ending") != OK:
		push_error("signal connect fail")
	if PlayerData.has_drink and PlayerData.has_finger and PlayerData.has_gaslight:
		$sacrifice.visible = true
		$flee.visible = true
		$items.visible = true
		$textbox.initialize(["""An Altar Waiting Sacrifice.
There's a trap door under the altar."""])
	else:
		$sacrifice.visible = false
		$flee.visible = false
		$items.visible = false
		$textbox.initialize(["An Altar."])

func _go_to_right_desks() -> void:
	Music.end_shepherd()
	if get_tree().change_scene_to(PlayerData.right_desks_dir) != OK:
		push_error("fail to change scene to hallway")

func _sacrifice_ending() -> void:
	Music.end_shepherd()
	PlayerData.ending = 2
	if get_tree().change_scene("res://src/endings/ending.tscn") != OK:
		push_error("fail to change scene")

func _flee_ending() -> void:
	Music.end_shepherd()
	PlayerData.ending = 3
	if get_tree().change_scene("res://src/endings/ending.tscn") != OK:
		push_error("fail to change scene")
