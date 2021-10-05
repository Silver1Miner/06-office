extends KinematicBody2D

signal enter_screen

onready var _animation = $AnimationPlayer
onready var prompts = $Prompts
var active := true
var can_enter_screen := false
onready var progress = $Prompts/TextureProgress

func _ready() -> void:
	pass

var speed = 200  # pixels/second
var velocity = Vector2.ZERO
func get_input():
	velocity = Vector2.ZERO
	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
		_animation.play("walk_right")
	elif Input.is_action_pressed('ui_left'):
		velocity.x -= 1
		_animation.play("walk_left")
	elif Input.is_action_pressed('ui_down'):
		velocity.y += 1
		_animation.play("walk_down")
	elif Input.is_action_pressed('ui_up'):
		velocity.y -= 1
		_animation.play("walk_up")
	velocity = velocity.normalized() * speed

func _physics_process(_delta: float) -> void:
	if active:
		get_input()
		velocity = move_and_slide(velocity)
	if can_enter_screen and Input.is_key_pressed(KEY_R):
		progress.value += 1
		if progress.value == 100:
			progress.value = 0
			emit_signal("enter_screen")
	else:
		progress.value = 0

func _on_AnimationPlayer_animation_finished(_anim_name: String) -> void:
	_animation.stop()

func _on_detection_area_entered(area: Area2D) -> void:
	if area.is_in_group("computer"):
		prompts.visible = true
		can_enter_screen = true

func _on_detection_area_exited(area: Area2D) -> void:
	if area.is_in_group("computer"):
		prompts.visible = false
		can_enter_screen = false
