extends Node

var elapsed_time: float = 0.0
var speed_multiplier: float = 1.0

const MAX_MULTIPLIER: float = 4.0 
const TIME_TO_MAX: float    = 45.0

var is_running: bool = false


func start_timing() -> void:
	is_running = true

func stop_timing() -> void:
	is_running = false

func reset() -> void:
	elapsed_time    = 0.0
	speed_multiplier = 1.0
	is_running = false

func _process(delta: float) -> void:
	if not is_running:
		return
	elapsed_time += delta

	var t: float = clamp(elapsed_time / TIME_TO_MAX, 0.0, 1.0)

	var s: float  = smoothstep(0.0, 1.0, t)
	speed_multiplier = lerp(1.0, MAX_MULTIPLIER, s)
