extends Node2D

@onready var bg: Sprite2D = $background
@onready var horse: CharacterBody2D = $horse
@onready var grass_bg = $grassBackground
var obstacle = preload("res://fence.tscn")
@onready var colors: CanvasModulate = $CanvasModulate
@onready var text: RichTextLabel = $RichTextLabel

var game_running: bool
const BASE_BACKSPEED: float  = 750.0
const BASE_SPAWN_MAX: float  = 2.5
const MIN_SPAWN_WAIT: float  = 0.4


func _ready():
	game_running = false
	$fenceTimer.stop()
	Global.reset()

	await get_tree().create_timer(3.0).timeout
	start_game()

func _process(_delta: float):
	if not game_running:
		return

	grass_bg.backspeed = BASE_BACKSPEED * Global.speed_multiplier

	var t: float = clamp(Global.elapsed_time / Global.TIME_TO_MAX, 0.0, 1.0)
	$fenceTimer.wait_time = lerp(BASE_SPAWN_MAX, MIN_SPAWN_WAIT, t)

func start_game():
	colors.color = Color(1, 1, 1, 1)
	text.visible = false

	game_running = true
	Global.start_timing()
	$fenceTimer.start()

func _on_fence_timer_timeout():
	var obs = obstacle.instantiate()
	obs.position = Vector2(719, 409)
	add_child(obs)
	$fenceTimer.start()
