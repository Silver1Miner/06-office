extends Control

onready var textbox = $textbox
onready var lobby = $lobby
onready var work_desks = $work_desks
onready var hallway = $hallway

var office_text = {
	"0": {
		"text": "The main work area."
	},
}

func _ready() -> void:
	if work_desks.connect("go_to_hallway", self, "_on_go_to_hallway") != OK:
		push_error("office signal connect fail")
	if hallway.connect("go_to_work_desks", self, "_on_go_to_work_desks") != OK:
		push_error("office signal connect fail")
	textbox.initialize(office_text)

func _on_go_to_hallway() -> void:
	work_desks.visible = false
	lobby.visible = false
	hallway.visible = true
	textbox.initialize({"0":{"text":"The office hallway"}})

func _on_go_to_work_desks() -> void:
	lobby.visible = false
	hallway.visible = false
	work_desks.visible = true
	textbox.initialize({"0":{"text":"The main work area"}})
