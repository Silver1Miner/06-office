extends TextureButton

signal meter_full
onready var progress = $TextureProgress

func _ready() -> void:
	progress.value = 0

func change_label(new_label) -> void:
	$Label.text = new_label

func _process(_delta: float) -> void:
	if pressed:
		progress.value += PlayerData.screen_switch_speed
		if progress.value == 100:
			progress.value = 0
			pressed = false
			emit_signal("meter_full")
	else:
		progress.value = 0
