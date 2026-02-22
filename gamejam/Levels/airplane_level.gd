extends Node2D

@onready var airplane: CharacterBody2D = $Airplane
@onready var colors: CanvasModulate = $CanvasModulate
@onready var text: RichTextLabel = $RichTextLabel

func _change_scene():
	get_tree().change_scene_to_file("res://car_level.tscn")

@export var bird : PackedScene = preload("res://bird.tscn")

var game_running: bool
var game_over: bool
var scroll
var scroll_speed: int = 2
var screen_size: Vector2i

func _ready() -> void:
	screen_size = get_window().size
	game_running = false
	game_over = false
	scroll = 0

	$BirdTimer.stop()
	
	await get_tree().create_timer(3.0).timeout
	start_game()

func start_game():
	colors.color = Color(1, 1, 1, 1)
	text.visible = false
	
	
	game_running = true
	game_over = false
	scroll = 0

	airplane.game_started = true

	$BirdTimer.start()

func _process(delta: float):
	if not game_running:
		return

	scroll += scroll_speed
	if scroll >= screen_size.x:
		scroll = 0
		$TextureRect.position.x = -scroll
		
	

func _on_bird_timer_timeout() -> void:
	var birdInstance = bird.instantiate()
	birdInstance.position.y = randi_range(0, 480)
	birdInstance.position.x = 640

	add_child(birdInstance)
	$BirdTimer.start()

func _on_ground_body_entered(body: Node2D) -> void:
	_change_scene()

func _on_ground_2_body_entered(body: Node2D) -> void:
	_change_scene()
