extends TextureRect

func _ready() -> void:
	if $to_work_desks.connect("meter_full", self, "_go_to_desks") != OK:
		push_error("signal connect fail")
	if $to_lobby.connect("meter_full", self, "_go_to_lobby") != OK:
		push_error("signal connect fail")
	if $to_office.connect("meter_full", self, "_go_to_office") != OK:
		push_error("signal connect fail")
	if $to_right.connect("meter_full", self, "_go_to_right") != OK:
		push_error("signal connect fail")
	if PlayerData.has_key:
		$to_right.visible = true
	else:
		$to_right.visible = false
	if PlayerData.has_gaslight:
		$Light2D.enabled = true
		if PlayerData.has_not_seen and !PlayerData.easy_mode:
			try_flash()
	else:
		$Light2D.enabled = false
	$textbox.initialize(["The office hallway. My computer desk is to the left."])

func try_flash() -> void:
	randomize()
	if rand_range(0, 10) > 8:
		yield(get_tree().create_timer(0.8), "timeout")
		PlayerData.has_not_seen = false
		$flash.visible = true
		yield(get_tree().create_timer(0.08), "timeout")
		$flash.visible = false

func _go_to_desks() -> void:
	if get_tree().change_scene_to(PlayerData.work_desks_dir) != OK:
		push_error("fail to change scene")

func _go_to_lobby() -> void:
	if get_tree().change_scene_to(PlayerData.lobby_dir) != OK:
		push_error("fail to change scene")

func _go_to_office() -> void:
	if get_tree().change_scene_to(PlayerData.office_dir) != OK:
		push_error("fail to change scene")

func _go_to_right() -> void:
	if get_tree().change_scene_to(PlayerData.right_desks_dir) != OK:
		push_error("fail to change scene")
