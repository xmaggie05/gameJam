extends CharacterBody2D

const move_speed: float = 50.0
const lanes: Array = [160, 320 , 480]

var starting_point: Vector2 = Vector2.ZERO
var current_lane: int = 1
var target_lane: int = 1

var has_hit: bool = false

func _ready() -> void:
	starting_point = global_transform.origin
	
func _physics_process(delta: float) -> void:
	var direction: Vector2 = Vector2.ZERO
	
	if Input.is_action_just_pressed("ui_left") and target_lane > 0:
		target_lane -= 1
	if Input.is_action_just_pressed("ui_right") and target_lane < lanes.size() - 1:
		target_lane += 1
	
		
	var target_x: float = lanes[target_lane]
	var current_x: float = global_transform.origin.x
	global_transform.origin.x = lerp(current_x, target_x, move_speed * delta)
	
