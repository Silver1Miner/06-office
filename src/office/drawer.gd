extends TextureRect

func _ready() -> void:
	if $take_gaslight.connect("meter_full", self, "_take_gaslight") != OK:
		push_error("signal connect fail")
	if $to_office.connect("meter_full", self, "_go_to_office") != OK:
		push_error("signal connect fail")
	if !PlayerData.has_gaslight:
		$take_gaslight.visible = true
	else:
		$take_gaslight.visible = false
	$textbox.initialize(["The contents of the manager's desk."])

func _take_gaslight() -> void:
	PlayerData.has_gaslight = true
	$inventory_hud.update_display()
	if get_tree().change_scene_to(PlayerData.office_dir) != OK:
		push_error("fail to change scene")

func _go_to_office() -> void:
	if get_tree().change_scene_to(PlayerData.office_dir) != OK:
		push_error("fail to change scene")
