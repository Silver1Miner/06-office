extends TextureRect

#onready var screen = $screen

func _ready() -> void:
	select_background()
	if $to_computer.connect("meter_full", self, "_on_screen_enter") != OK:
		push_error("signal connect fail")
	if $to_hallway.connect("meter_full", self, "_go_to_hallway") != OK:
		push_error("signal connect fail")
	if $to_bulletin.connect("meter_full", self, "_go_to_bulletin") != OK:
		push_error("signal connect fail")
	if $hack_computer.connect("meter_full", self, "_hack_computer") != OK:
		push_error("signal connect fail")
	if PlayerData.has_finger:
		$hack_computer.visible = true
	else:
		$hack_computer.visible = false
	#if screen.connect("exit_screen", self, "_on_screen_exit") != OK:
	#	push_error("signal connect fail")
	$textbox.initialize(["My work area. Where is everybody?"])

func select_background() -> void:
	randomize()
	if rand_range(1,10) > 9:
		texture = load("res://assets/office/workdesks.jpg")
		$Tooltip.visible = true
		$to_computer.rect_position = Vector2(380,260)
	else:
		texture = load("res://assets/office/workdesks2.jpg")
		$Tooltip.visible = false
		$to_computer.rect_position = Vector2(330,300)

func _on_screen_enter() -> void:
	#print("screen entered from work desks")
	#$textbox.visible = false
	#screen.visible = true
	#screen.active = true
	Music.play_effect(0)
	if get_tree().change_scene_to(PlayerData.screen) != OK:
		push_error("fail to change scene to screen")

#func _on_screen_exit() -> void:
	#print("screen exited")
	#$textbox.visible = true
	#screen.active = false
	#screen.visible = false

func _go_to_hallway() -> void:
	if get_tree().change_scene_to(PlayerData.hallway_dir) != OK:
		push_error("fail to change scene to hallway")

func _go_to_bulletin() -> void:
	if get_tree().change_scene_to(PlayerData.bulletin_dir) != OK:
		push_error("fail to change scene to bulletin")

func _hack_computer() -> void:
	PlayerData.ending = 3
	if get_tree().change_scene("res://src/endings/ending.tscn") != OK:
		push_error("fail to change scene to ending")
