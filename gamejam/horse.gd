extends CharacterBody2D

var velocty = Vector2.ZERO
var jump_velocity = Vector2.UP * 1000
var speed_velocity = Vector2.RIGHT * 1000000
var gravity = Vector2.DOWN * 2400

func _process(delta):
	#makes the user jump
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity = jump_velocity
	if !is_on_floor():
		velocity += gravity * delta
	
	move_and_slide()

func fence_hit():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
