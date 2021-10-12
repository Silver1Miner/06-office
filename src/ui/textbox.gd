extends Control

signal text_finished
var page := "0"
var text_playing = true
onready var text = $text
onready var timer = $Timer

func _ready() -> void:
	timer.wait_time = 0.02
	timer.autostart = true
	if timer.connect("timeout", self, "_on_timer_timeout") != OK:
		push_error("timer connect fail")
	#initialize(dialogue)
	visible = false

var dialogue = {
	"0": {
		"text": "This is a placeholder!"
	},
}

func initialize(scene) -> void:
	visible = true
	timer.start()
	dialogue = scene
	text_playing = true
	page = "0"
	if not page in dialogue:
		end_text()
	text.set_bbcode(dialogue[page]["text"])
	text.set_visible_characters(0)
	set_process_input(true)

func _on_next_pressed() -> void:
	if text_playing:
		if text.get_visible_characters() > text.get_total_character_count():
			if int(page) < dialogue.size() - 1:
				page = str(int(page) + 1)
				text.set_bbcode(dialogue[page]["text"])
				text.set_visible_characters(0)
			elif int(page) >= dialogue.size() - 1:
				end_text()
		else:
			text.set_visible_characters(text.get_total_character_count())

func _on_skip_pressed() -> void:
	if text_playing:
		end_text()

func _input(event) -> void:
	if text_playing:
		if event.is_action_pressed("ui_accept") or event.is_action_pressed("left_click"):
			_on_next_pressed()
		elif event.is_action_pressed("ui_cancel") or event.is_action_pressed("right_click"):
			_on_skip_pressed()

func _on_timer_timeout() -> void:
	text.set_visible_characters(text.get_visible_characters()+1)

func end_text() -> void:
	get_tree().paused = false
	#visible = false
	emit_signal("text_finished")

