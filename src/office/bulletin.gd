extends TextureRect

func _ready() -> void:
	$Timer.wait_time = rand_range(0, 30)
	$Timer.start()
	if $to_work_desks.connect("meter_full", self, "_go_to_desks") != OK:
		push_error("signal connect fail")
	$textbox.initialize(["The back wall. Sometimes people post things here."])

func _go_to_desks() -> void:
	if get_tree().change_scene_to(PlayerData.work_desks_dir) != OK:
		push_error("fail to change scene")

func _on_Timer_timeout() -> void:
	Music.play_effect(5)
