extends ColorRect

var text_playing = true
onready var text = $text
onready var timer = $Timer

func _ready() -> void:
	color = Color(0,0,0,20.0/255)
	text.set_visible_characters(0)
	timer.wait_time = 0.02
	if timer.connect("timeout", self, "_on_timer_timeout") != OK:
		push_error("timer connect fail")

func _on_timer_timeout() -> void:
	if text_playing:
		text.set_visible_characters(text.get_visible_characters()+1)

func _on_Tooltip_mouse_entered() -> void:
	color = Color(0,0,0,40.0/255)
	text.set_visible_characters(0)
	text_playing = true
	timer.start()

func _on_Tooltip_mouse_exited() -> void:
	color = Color(0,0,0,20.0/255)
	text_playing = false
	text.set_visible_characters(0)

