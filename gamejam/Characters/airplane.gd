extends CharacterBody2D

const gravity: int = 1000
const max_vel: int = 500
const flap_speed: int = -400
const start_pos := Vector2(100, 300)

var flying: bool = false
var falling: bool = false
var game_started: bool = false
var start_delay: float = 100.0
var time_elapsed: float = 0.0

func _ready():
	reset()

func _process(delta): 
	if not game_started and not Input.is_action_just_pressed("up"):
		return

	if Input.is_action_just_pressed("up"):
		flying = true
		flap()
	else:
		falling = true

func _physics_process(delta: float) -> void:
	if falling or flying:
		velocity.y += gravity * delta

		if velocity.y > max_vel:
			velocity.y = max_vel

		if flying:
			rotation = deg_to_rad(velocity.y * 0.05)
		elif falling:
			rotation = PI / 2

		move_and_collide(velocity * delta)

func reset():
	falling = false
	flying = false
	game_started = false
	position = start_pos
	velocity = Vector2.ZERO
	rotation = 0.0

func flap():
	velocity.y = flap_speed

func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
