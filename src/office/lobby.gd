extends TextureRect

func _ready() -> void:
	if $to_hallway.connect("meter_full", self, "_go_to_hallway") != OK:
		push_error("signal connect fail")
	if $to_elevator.connect("meter_full", self, "_go_to_elevator") != OK:
		push_error("signal connect fail")
	if $to_restroom.connect("meter_full", self, "_go_to_bathroom") != OK:
		push_error("signal connect fail")
	if $to_kitchen.connect("meter_full", self, "_go_to_kitchen") != OK:
		push_error("signal connect fail")
	if PlayerData.tags_completed < 6:
		$textbox.initialize(["The office lobby. Doubles as a kitchen."])
		$to_kitchen.visible = false
	else:
		$textbox.initialize(["The office lobby. A place to rest up after work."])
		$to_kitchen.visible = true
	if PlayerData.current_level < 1:
		PlayerData.current_level = 1

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
