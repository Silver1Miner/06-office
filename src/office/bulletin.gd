extends TextureRect

func _ready() -> void:
	$Timer.wait_time = rand_range(0, 30)
	$Timer.start()
	if $take_key.connect("meter_full", self, "_take_key") != OK:
		push_error("signal connect fail")
	if $to_work_desks.connect("meter_full", self, "_go_to_desks") != OK:
		push_error("signal connect fail")
	if PlayerData.has_key:
		$key.visible = false
		$take_key.visible = false
	if PlayerData.has_not_seen:
		$sighting.visible = false
	else:
		$sighting.visible = true
		randomize()
		if rand_range(0,3) < 2:
			$sighting.rect_rotation = 8
		else:
			$sighting.rect_rotation = -4
	if rand_range(0,3) < 2:
		$gnome_poster.rect_rotation = 5
		$slogan/slogan.text = """WORK GIVES YOU MEANING AND PURPOSE
AND LIFE IS EMPTY WITHOUT IT"""
	else:
		$gnome_poster.rect_rotation = -2
		$slogan/slogan.text = """WORK GIVES YOU PURPOSE AND MEANING
LIFE IS EMPTY WITHOUT IT"""
	if PlayerData.has_not_taken_key:
		$Tooltip2/text.text = """A Poster

People like to hang stuff off the nail sticking out in the bottom corner as a 'lost and found.'"""
	else:
		$Tooltip2/text.text = """A Poster

I like to hang the key off the nail sticking out in the bottom corner as a place to keep it."""
	$textbox.initialize(["The back wall. Sometimes people post or write things here."])

func _go_to_desks() -> void:
	if get_tree().change_scene_to(PlayerData.work_desks_dir) != OK:
		push_error("fail to change scene")

func _on_Timer_timeout() -> void:
	Music.play_effect(5)

func _take_key() -> void:
	PlayerData.has_key = true
	PlayerData.has_not_taken_key = false
	$inventory_hud.update_display()
	$key.visible = false
	$take_key.visible = false
	$textbox.initialize(["Took the key off the poster"])
	Music.play_effect(5)
	PlayerData.screen_switch_speed = 1
