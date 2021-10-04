extends KinematicBody2D

onready var _animation = $AnimationPlayer
var active := true

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


func _on_AnimationPlayer_animation_finished(_anim_name: String) -> void:
	_animation.stop()
