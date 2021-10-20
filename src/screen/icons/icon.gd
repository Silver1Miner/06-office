extends TextureButton

export var identity = "MAIL"
export var icon_texture = preload("res://assets/screen/icons/internet-mail.png")
signal icon_pressed

onready var timer = $Timer

var first_press = false

func _ready() -> void:
	texture_disabled = icon_texture
	texture_focused = icon_texture
	texture_hover = icon_texture
	texture_normal = icon_texture
	texture_pressed = icon_texture
	if connect("pressed", self, "_on_pressed") != OK:
		push_error("icon press connect fail")
	if timer.connect("timeout", self, "_on_timer_timeout") != OK:
		push_error("timer connect fail")

func _on_pressed() -> void:
	Music.play_effect(2)
	emit_signal("icon_pressed", identity)
	#if first_press:
	#	emit_signal("icon_pressed", identity)
	#	first_press = false
	#else:
	#	first_press = true
	#	timer.start()

func _on_timer_timeout() -> void:
	first_press = false
