extends StaticBody2D

export var computer_id := 2
onready var interaction := $Interaction

func _ready() -> void:
	interaction.add_to_group("computer")

func get_computer_id() -> int:
	return computer_id
