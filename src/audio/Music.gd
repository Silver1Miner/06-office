extends AudioStreamPlayer

var tracks = [
	preload("res://assets/music/Working_Music.ogg"),
	preload("res://assets/music/540634__shortrecord__horror-ambient.mp3"),
]

func _ready() -> void:
	pass
	#play_track(0)

func play_track(index: int) -> void:
	stream = tracks[index]
	play(0)

func play_effect(index: int) -> void:
	$Sound.stream = effects[index]
	$Sound.play(0)

func play_sheperd() -> void:
	$Sheperd.stream = preload("res://assets/music/274487__brainclaim__shepard-tone.ogg")
	$Sheperd.play(0)

func end_shepherd() -> void:
	$Sheperd.stop()

var effects = [
	preload("res://assets/sound/on.ogg"), #0
	preload("res://assets/sound/off.ogg"), #1
	preload("res://assets/sound/mouseclick1.ogg"), #2
	preload("res://assets/sound/button1.ogg"), #3
	preload("res://assets/sound/button2.ogg"), #4
	preload("res://assets/sound/366111__dkiller2204__indoor-footsteps.ogg"),
	preload("res://assets/sound/confirmation_002.ogg"), #6
]
