extends TextureRect

func _ready() -> void:
	randomize_text()
	if $to_altar.connect("meter_full", self, "_go_to_altar") != OK:
		push_error("signal connect fail")
	if $to_hallway.connect("meter_full", self, "_go_to_hallway") != OK:
		push_error("signal connect fail")
	$textbox.initialize(["The right side work area. Where is everybody?"])

func _go_to_hallway() -> void:
	if get_tree().change_scene_to(PlayerData.hallway_dir) != OK:
		push_error("fail to change scene to hallway")

func _go_to_altar() -> void:
	if get_tree().change_scene_to(PlayerData.altar_dir) != OK:
		push_error("fail to change scene to hallway")

func randomize_text() -> void:
	if rand_range(1, 6) > 4:
		$slogan.text = """ACHIEVEMENT IS BORN
FROM SACRIFICE"""
	else:
		$slogan.text = """ACHIEVEMENT IS BORN
FROM YOUR SACRIFICE"""
