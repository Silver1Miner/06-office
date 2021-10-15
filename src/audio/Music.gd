extends AudioStreamPlayer

var tracks = [
	preload("res://assets/music/Working_Music.ogg"),
]

func _ready() -> void:
	set_track(0)

func set_track(index: int) -> void:
	stream = tracks[index]
	play(0)
