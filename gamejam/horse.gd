extends CharacterBody2D

var jump_force = 400.0
var gravity = 900.0
var fast_fall_gravity = 5000.0
var max_fall_speed = 1200.0

@onready var animation = $AnimationPlayer

func _physics_process(delta):

	# Apply gravity
	if !is_on_floor():
		if Input.is_action_pressed("down"):
			velocity.y += fast_fall_gravity * delta
		else:
			velocity.y += gravity * delta

		# Clamp fall speed
		velocity.y = min(velocity.y, max_fall_speed)

	# Jump
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = -jump_force

	# Animation
	if !is_on_floor():
		if animation.current_animation != "jump":
			animation.play("jump")
	else:
		if animation.current_animation != "walk":
			animation.play("walk")

	move_and_slide()
