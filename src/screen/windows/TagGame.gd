extends Control

onready var enter = $Panels/Options/Enter
onready var cancel = $Panels/Options/Cancel
onready var tags = $Panels/Display/ItemList
onready var image = $Panels/Display/TextureRect
onready var text = $Panels/Display/TextureRect/RichTextLabel
onready var progress = $Panels/Options/Progress

var completed := 0

func _ready() -> void:
	if enter.connect("pressed", self, "_on_enter_pressed") != OK:
		push_error("enter connect fail")
	if cancel.connect("pressed", self, "_on_cancel_pressed") != OK:
		push_error("cancel connect fail")
	update_display(0)
	progress.text = "PROGRESS: " + str(PlayerData.tags_completed) + "/6"

func _on_enter_pressed() -> void:
	PlayerData.tags_completed += 1
	if PlayerData.tags_completed >= 6:
		progress.text = "PROGRESS: " + str(PlayerData.tags_completed) + "/6 QUOTA REACHED"
	else:
		progress.text = "PROGRESS: " + str(PlayerData.tags_completed) + "/6"
	if completed < 10:
		update_display_random()

func _on_cancel_pressed() -> void:
	tags.unselect_all()

func update_display(i: int) -> void:
	if displays[i]["image"] != "":
		image.texture = load(displays[i]["image"])
	text.bbcode_text = displays[i]["text"]
	tags.clear()
	for n in len(displays[i]["tags"]):
		tags.add_item(displays[i]["tags"][n])
		tags.set_item_tooltip_enabled(n, false)
	tags.unselect_all()

func update_display_random() -> void:
	randomize()
	var choice = rand_range(0, len(displays))
	update_display(choice)

var displays := {
	0: {
		"image": "res://assets/tags/pexels-eva-elijas-5503384.jpg",
		"tags": ["FOOD", "MEAT", "BEEF", "BLOOD"],
		"text": "",
	},
	1: {
		"image": "res://assets/tags/pexels-cottonbro-5553772.jpg",
		"tags": ["DELICIOUS", "HAPPY", "JOYOUS", "SEEING"],
		"text": "",
	},
	2: {
		"image": "res://assets/tags/pexels-azra-tuba-demir-7806416.jpg",
		"tags": ["PACKAGE", "SOFT", "HEAVY", "BREATHE"],
		"text": "",
	},
	3: {
		"image": "res://assets/tags/pexels-jimmy-chan-2454796.jpg",
		"tags": ["INDUSTRY", "GREEN", "CHARGE", "CHILL"],
		"text": "",
	},
}
