extends Node2D

@onready var bg_mat: ShaderMaterial = $TextureRect.material
@onready var colors: CanvasModulate = $CanvasModulate
@onready var text: RichTextLabel    = $RichTextLabel

@export var platform: PackedScene = preload("res://skate_platform.tscn")

var game_running: bool  = false
var next_x: float       = 720.0

const PLATFORM_Y: float   = 400.0
const SCREEN_RIGHT: float = 720.0

const MIN_PLATFORM: float = 80.0
const MAX_PLATFORM: float = 250.0

const MIN_GAP_BASE: float = 60.0
const MAX_GAP_BASE: float = 140.0
const MIN_GAP_MAX: float  = 100.0
const MAX_GAP_MAX: float  = 220.0


func _ready() -> void:
	game_running = false
	_spawn_platform(0.0, 400.0)
	next_x = 500.0

	await get_tree().create_timer(3.0).timeout
	start_game()


func start_game() -> void:
	colors.color = Color(1, 1, 1, 1)
	text.visible = false
	game_running  = true

	if not GameState.is_running:
		GameState.start_timing()


func _process(delta: float) -> void:
	if not game_running:
		return

	bg_mat.set_shader_parameter("speed_multiplier", GameState.speed_multiplier)

	var scroll_speed: float = 400.0 * GameState.speed_multiplier
	next_x -= scroll_speed * delta

	if next_x <= SCREEN_RIGHT:
		var t: float       = clamp(GameState.elapsed_time / GameState.TIME_TO_MAX, 0.0, 1.0)
		var min_gap: float = lerp(MIN_GAP_BASE, MIN_GAP_MAX, t)
		var max_gap: float = lerp(MAX_GAP_BASE, MAX_GAP_MAX, t)

		var gap: float   = randf_range(min_gap, max_gap)
		var width: float = randf_range(MIN_PLATFORM, MAX_PLATFORM)

		_spawn_platform(SCREEN_RIGHT + gap, width)
		next_x = SCREEN_RIGHT + gap + width


func _spawn_platform(x: float, width: float) -> void:
	var plat = platform.instantiate()
	plat.position = Vector2(x, PLATFORM_Y)
	plat.call("set_width", width)
	add_child(plat)
