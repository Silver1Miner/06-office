extends ColorRect

onready var music_volume = $volume_controls/music_volume
onready var sound_volume = $volume_controls/sound_volume

func _ready() -> void:
	if music_volume.connect("value_changed", self, "_on_music_value_changed") != OK:
		push_error("volume signal connect fail")
	if sound_volume.connect("value_changed", self, "_on_sound_value_changed") != OK:
		push_error("sound signal connect fail")
	if $back.connect("pressed", self, "_on_back_pressed") != OK:
		push_error("button signal connect fail")
	$volume_controls/CheckBox.pressed = PlayerData.easy_mode
	if $volume_controls/CheckBox.connect("toggled", self, "_on_difficulty_toggled") != OK:
		push_error("toggle button connect fail")

func _on_difficulty_toggled(toggle: bool) -> void:
	PlayerData.easy_mode = toggle

func _on_music_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(
		AudioServer.get_bus_index("Music"), linear2db(value)
	)

func _on_sound_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(
		AudioServer.get_bus_index("Sound"), linear2db(value)
	)

func _on_back_pressed() -> void:
	visible = false
