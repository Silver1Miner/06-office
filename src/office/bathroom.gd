extends TextureRect

func _ready() -> void:
	if $to_lobby.connect("meter_full", self, "_go_to_lobby") != OK:
		push_error("signal connect fail")
	if $get_finger.connect("meter_full", self, "_take_finger") != OK:
		push_error("signal connect fail")
	if $to_secret_exit.connect("meter_full", self, "_to_secret_exit") != OK:
		push_error("signal connect fail")
	if PlayerData.has_gaslight:
		$Light2D.enabled = true
		if PlayerData.has_finger:
			texture = load("res://assets/office/bathroom.jpg")
			$gnome.visible = false
			$get_finger.visible = false
			$to_secret_exit.visible = true
			$textbox.initialize(["The office restroom. Huh, there's another exit in the back. Never noticed it before."])
		else:
			texture = load("res://assets/office/bathroom2.jpg")
			$gnome.visible = true
			$get_finger.visible = true
			$to_secret_exit.visible = false
			$textbox.initialize(["The office restroom. There's something in a urinal."])
	else:
		$to_secret_exit.visible = false
		$Light2D.enabled = false
		$get_finger.visible = false
		select_background()
		$textbox.initialize(["The office restroom. Seems darker than usual. Would be nice to have more light."])

func _go_to_lobby() -> void:
	if get_tree().change_scene_to(PlayerData.lobby_dir) != OK:
		push_error("fail to change scene")

func _take_finger() -> void:
	PlayerData.has_finger = true
	$inventory_hud.update_display()
	$get_finger.visible = false
	$textbox.initialize(["Found a severed finger."])

func _to_secret_exit() -> void:
	PlayerData.ending = 2
	if get_tree().change_scene("res://src/endings/ending.tscn") != OK:
		push_error("fail to go to ending")

func select_background() -> void:
	randomize()
	if rand_range(1,10) < 9:
		texture = load("res://assets/office/bathroom.jpg")
		$gnome.visible = false
	else:
		texture = load("res://assets/office/bathroom2.jpg")
		$gnome.visible = true
