extends TextureRect

func _ready() -> void:
	PlayerData.screen_switch_speed = 2
	if $to_hallway.connect("meter_full", self, "_go_to_hallway") != OK:
		push_error("signal connect fail")
	if $to_elevator.connect("meter_full", self, "_go_to_elevator") != OK:
		push_error("signal connect fail")
	if $to_restroom.connect("meter_full", self, "_go_to_bathroom") != OK:
		push_error("signal connect fail")
	if $to_kitchen.connect("meter_full", self, "_go_to_kitchen") != OK:
		push_error("signal connect fail")
	if PlayerData.tags_completed < 6:
		$textbox.initialize(["The office lobby. Doubles as a kitchen. People like to rest here after work."])
		$to_kitchen.visible = false
		$gnome.visible = true
		$Tooltip4.visible = true
	else:
		$textbox.initialize(["The office lobby. A place to rest up after work."])
		$to_kitchen.visible = true
		$gnome.visible = false
		$Tooltip4.visible = false
	if PlayerData.current_level < 1:
		PlayerData.current_level = 1
	if PlayerData.has_not_drunk:
		$Tooltip/text.text = """Refrigerator.
Nothing but energy drinks, restocked daily.
I never drink the stuff."""
	else:
		$Tooltip/text.text = """Refrigerator.
Nothing but energy drinks, restocked daily."""

func _go_to_bathroom() -> void:
	if get_tree().change_scene_to(PlayerData.bathroom_dir) != OK:
		push_error("fail to change scene")

func _go_to_hallway() -> void:
	if get_tree().change_scene_to(PlayerData.hallway_dir) != OK:
		push_error("fail to change scene")
	
func _go_to_elevator() -> void:
	if get_tree().change_scene_to(PlayerData.elevator_dir) != OK:
		push_error("fail to change scene")

func _go_to_kitchen() -> void:
	if get_tree().change_scene_to(PlayerData.kitchen_dir) != OK:
		push_error("fail to change scene")
