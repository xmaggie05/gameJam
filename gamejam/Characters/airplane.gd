extends CharacterBody2D

const gravity: int = 1000
const max_vel: int = 500
const flap_speed: int = -500
var flying: bool = false
var falling: bool = false
const start_pos:= Vector2(100, 400)

func _ready():
	reset()

func _process(delta):
	if Input.is_action_just_pressed("up"):
		flying = true
		flap()
	else:
		falling = true
	
func reset():
	falling = false
	flying = false
	position = start_pos
	set_rotation(0) #restart scroll to beginning
	
func _physics_process(delta: float) -> void:
	if falling or flying:
		velocity.y += gravity * delta
		
		if velocity.y > max_vel:
			velocity.y = max_vel
		if flying:
			rotation = (deg_to_rad(velocity.y * 0.05))
		elif falling:
			rotation = PI/2
		move_and_collide(velocity * delta)
	
func flap():
	velocity.y = flap_speed
