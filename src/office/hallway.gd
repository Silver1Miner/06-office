extends TextureRect

func _ready() -> void:
	if $to_work_desks.connect("meter_full", self, "_go_to_desks") != OK:
		push_error("signal connect fail")
	if $to_lobby.connect("meter_full", self, "_go_to_lobby") != OK:
		push_error("signal connect fail")
	$textbox.initialize({"0":{"text":"The office hallway"}})

func _go_to_desks() -> void:
	if get_tree().change_scene(PlayerData.work_desks_dir) != OK:
		push_error("fail to change scene")

func _go_to_lobby() -> void:
	if get_tree().change_scene(PlayerData.lobby_dir) != OK:
		push_error("fail to change scene")
