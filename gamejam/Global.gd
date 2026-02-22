extends Node

var score: int = 0
var running: bool = false
var high_score: int = 0

func start_game():
	score = 0
	running = true

func stop_game():
	running = false
	if score > high_score:
		high_score = score

func _process(delta):
	if running:
		score += 1

func deduct_points(amount: int):
	score -= amount
	if score < 0:
		score = 0
	
func pause_for_seconds(seconds: float) -> void:
	running = false
	await get_tree().create_timer(seconds).timeout
	running = true
