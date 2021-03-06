extends TextureButton

signal meter_full
onready var progress = $TextureProgress

func _ready() -> void:
	progress.value = 0

func change_label(new_label) -> void:
	$Label.text = new_label

func _process(_delta: float) -> void:
	if pressed:
		if progress.value < 110:
			progress.value += PlayerData.screen_switch_speed
			if progress.value == 110:
				emit_signal("meter_full")
				pressed = false
	else:
		progress.value = 0
