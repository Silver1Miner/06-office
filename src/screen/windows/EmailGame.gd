extends HBoxContainer

onready var mail_headings = $mail_headings

func _ready() -> void:
	pass

var emails := {
	"Reminder to all Employees": {"date": ""},
	"Disclaimer": {"date": ""},
	"Changes to Employment Agreement": {"date": ""},
}
