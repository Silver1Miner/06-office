extends Control

onready var enter = $Panels/Options/Enter
onready var cancel = $Panels/Options/Cancel
onready var tags = $Panels/Display/ItemList
onready var image = $Panels/Display/TextureRect
onready var text = $Panels/Display/TextureRect/RichTextLabel

func _ready() -> void:
	if enter.connect("pressed", self, "_on_enter_pressed") != OK:
		push_error("enter connect fail")
	if cancel.connect("pressed", self, "_on_cancel_pressed") != OK:
		push_error("cancel connect fail")
	update_display(0)

func _on_enter_pressed() -> void:
	pass

func _on_cancel_pressed() -> void:
	pass

func update_display(i: int) -> void:
	if displays[i]["image"] != "":
		image.texture = load(displays[i]["image"])
	text.bbcode_text = displays[i]["text"]
	tags.clear()
	for n in displays[i]["tags"]:
		tags.add_item(n)

func update_display_random() -> void:
	pass

var displays := {
	0: {
		"image": "",
		"tags": ["SAD", "HAPPY"],
		"text": "",
	},
	1: {
		"image": "",
		"tags": [],
		"text": "",
	},
}
