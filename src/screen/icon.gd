extends TextureButton

export var identity = "mail"
signal icon_pressed

onready var timer = $Timer

var first_press = false

func _ready() -> void:
	if connect("pressed", self, "_on_pressed") != OK:
		push_error("icon press connect fail")
	if timer.connect("timeout", self, "_on_timer_timeout") != OK:
		push_error("timer connect fail")

func _on_pressed() -> void:
	if first_press:
		emit_signal("icon_pressed", identity)
		first_press = false
	else:
		first_press = true
		timer.start()

func _on_timer_timeout() -> void:
	first_press = false
