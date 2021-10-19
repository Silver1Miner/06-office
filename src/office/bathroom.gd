extends TextureRect

func _ready() -> void:
	select_background()
	if $to_lobby.connect("meter_full", self, "_go_to_lobby") != OK:
		push_error("signal connect fail")
	$textbox.initialize(["The office restroom. Seems dirtier than usual."])

func _go_to_lobby() -> void:
	if get_tree().change_scene_to(PlayerData.lobby_dir) != OK:
		push_error("fail to change scene")

func select_background() -> void:
	randomize()
	if rand_range(1,10) < 9:
		texture = load("res://assets/office/bathroom.jpg")
	else:
		texture = load("res://assets/office/bathroom2.jpg")
