extends TextureRect

func _ready() -> void:
	if $to_lobby.connect("meter_full", self, "_go_to_lobby") != OK:
		push_error("signal connect fail")
	if $get_drink.connect("meter_full", self, "_get_drink") != OK:
		push_error("signal connect fail")
	if $take_casserole.connect("meter_full", self, "_take_casserole") != OK:
		push_error("signal connect fail")
	if $eat.connect("meter_full", self, "_eat") != OK:
		push_error("signal connect fail")
	$gnome.visible = (PlayerData.tags_completed >= 6)
	update_view()
	$textbox.initialize(["The office kitchen. A place to eat and drink."])

func _go_to_lobby() -> void:
	if get_tree().change_scene_to(PlayerData.lobby_dir) != OK:
		push_error("fail to change scene")

func _get_drink() -> void:
	PlayerData.has_drink = true
	$inventory_hud.update_display()
	update_view()

func _take_casserole() -> void:
	PlayerData.has_casserole = true
	$inventory_hud.update_display()
	update_view()

func _eat() -> void:
	PlayerData.ending = 0
	if get_tree().change_scene("res://src/endings/ending.tscn") != OK:
		push_error("fail to change scene")

func update_view() -> void:
	$get_drink.visible = !PlayerData.has_drink
	$take_casserole.visible = !PlayerData.has_casserole and PlayerData.has_drink
	$eat.visible = PlayerData.has_drink and PlayerData.has_casserole
