extends Light2D

onready var noise = OpenSimplexNoise.new()
var value = 0.0
var on := true
const MAX_VALUE = 20000000

func _ready() -> void:
	randomize()
	value = randi() % MAX_VALUE
	noise.period = 4

func _physics_process(_delta: float) -> void:
	value += 0.5
	if value > MAX_VALUE:
		value = 0.0
	var alpha = ((noise.get_noise_1d(value) + 1)/4.0) + 0.5
	self.color = Color(color.r,color.g,color.b, alpha)
