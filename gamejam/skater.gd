extends CharacterBody2D

var jump_force: float     = 600.0
var gravity: float        = 1100.0
var max_fall_speed: float = 1400.0
const DEATH_Y: float = 620.0

@onready var animation = $AnimationPlayer


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta
		velocity.y = min(velocity.y, max_fall_speed)

	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = -jump_force

	if not is_on_floor():
		if animation.current_animation != "jump":
			animation.play("jump")
	else:
		if animation.current_animation != "skate":
			animation.play("skate")

	move_and_slide()

	if position.y > DEATH_Y:
		get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
