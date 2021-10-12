extends TextureRect

func _ready() -> void:
	if $to_hallway.connect("meter_full", self, "_go_to_hallway") != OK:
		push_error("signal connect fail")
	$textbox.initialize({"0":{"text":"The office lobby. Doubles as a kitchen."}})

func _go_to_hallway() -> void:
	if get_tree().change_scene_to(PlayerData.hallway_dir) != OK:
		push_error("fail to change scene")
