extends Node2D

@onready var bg_mat: ShaderMaterial = $TextureRect.material
@export var bird: PackedScene = preload("res://bird.tscn")

@onready var airplane: CharacterBody2D = $Airplane
@onready var colors: CanvasModulate = $CanvasModulate
@onready var text: RichTextLabel = $RichTextLabel

var game_running: bool = false

const BASE_SPAWN_MAX: float = 2.0
const MIN_SPAWN_WAIT: float = 0.35

func _change_scene() -> void:
	Global.stop_timing()
	get_tree().change_scene_to_file("res://car_level.tscn")

func _ready() -> void:
	game_running = false
	$BirdTimer.stop()

	await get_tree().create_timer(3.0).timeout
	start_game()

func start_game() -> void:
	colors.color = Color(1, 1, 1, 1)
	text.visible = false
	game_running = true
	airplane.game_started = true

	if not Global.is_running:
		Global.start_timing()

	$BirdTimer.start()

func _process(_delta: float) -> void:
	if not game_running:
		return

	bg_mat.set_shader_parameter("speed_multiplier", Global.speed_multiplier)

	var t: float = clamp(Global.elapsed_time / Global.TIME_TO_MAX, 0.0, 1.0)
	$BirdTimer.wait_time = lerp(BASE_SPAWN_MAX, MIN_SPAWN_WAIT, t)

func _on_bird_timer_timeout() -> void:
	var birdInstance: Area2D = bird.instantiate() as Area2D
	birdInstance.position.y = randi_range(0, 480)
	birdInstance.position.x = 640
	add_child(birdInstance)
	$BirdTimer.start()

func _on_ground_body_entered(_body: Node2D) -> void:
	_change_scene()

func _on_ground_2_body_entered(_body: Node2D) -> void:
	_change_scene()

#@onready var bg_mat: ShaderMaterial = $TextureRect.material
#@export var bird : PackedScene = preload("res://bird.tscn")
#
#@onready var airplane: CharacterBody2D = $Airplane
#@onready var colors: CanvasModulate = $CanvasModulate
#@onready var text: RichTextLabel = $RichTextLabel
#
#func _change_scene():
	#get_tree().change_scene_to_file("res://car_level.tscn")
#
#var game_running: bool
#var game_over: bool
#var scroll
#var scroll_speed: int = 2
#var screen_size: Vector2i
#var elapsed_time: float = 0.0
#var speed_multiplier: float = 1.0
#
#const MAX_MULTIPLIER: float = 3.0
#const TIME_TO_MAX_SPEED: float = 60.0
#
#func _ready() -> void:
	#screen_size = get_window().size
	#game_running = false
	#game_over = false
	#scroll = 0
#
	#$BirdTimer.stop()
	#
	#await get_tree().create_timer(3.0).timeout
	#start_game()
#
#func start_game():
	#colors.color = Color(1, 1, 1, 1)
	#text.visible = false
	#
	#game_running = true
	#game_over = false
	#scroll = 0
#
	#airplane.game_started = true
	#$BirdTimer.start()
#
#func _process(delta: float) -> void:
	#if !game_running:
		#return
	#elapsed_time += delta
	#var t : float = clamp(elapsed_time / TIME_TO_MAX_SPEED, 0.0, 1.0)
	#var multiplier : float = lerp(1.0, MAX_MULTIPLIER, t)
	#bg_mat.set_shader_parameter("speed_multiplier", multiplier)
	#
#func _on_bird_timer_timeout() -> void:
	#var birdInstance: Area2D = bird.instantiate() as Area2D
	#birdInstance.position.y = randi_range(0, 480)
	#birdInstance.position.x = 640
#
	#add_child(birdInstance)
	#birdInstance.call("set_speed_multiplier", speed_multiplier)
	#$BirdTimer.start()
#
#func _on_ground_body_entered(body: Node2D) -> void:
	#_change_scene()
#
#func _on_ground_2_body_entered(body: Node2D) -> void:
	#_change_scene()
