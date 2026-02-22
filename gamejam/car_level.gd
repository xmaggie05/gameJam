extends Node2D

@onready var bg_mat: ShaderMaterial = $TextureRect.material
@onready var colors: CanvasModulate = $CanvasModulate
@onready var text: RichTextLabel = $RichTextLabel
@export var object: PackedScene = preload("res://Characters/object.tscn")

var game_running: bool = false

const BASE_SPAWN_MAX: float = 2.0
const MIN_SPAWN_WAIT: float = 0.4

func _ready() -> void:
	GameState.reset()
	game_running = false
	$ObjectTimer.stop()

	await get_tree().create_timer(3.0).timeout
	start_game()

func start_game() -> void:
	colors.color = Color(1, 1, 1, 1)
	text.visible = false
	game_running = true
	if not GameState.is_running:
		GameState.start_timing()
	$ObjectTimer.start()

func _process(_delta: float) -> void:
	if not game_running:
		return
	bg_mat.set_shader_parameter("speed_multiplier", GameState.speed_multiplier)
	var t: float = clamp(GameState.elapsed_time / GameState.TIME_TO_MAX, 0.0, 1.0)
	$ObjectTimer.wait_time = lerp(BASE_SPAWN_MAX, MIN_SPAWN_WAIT, t)

func _on_object_timer_timeout() -> void:
	var lanes_list: Array = [185, 330 , 475]
	var objectInstance: Area2D = object.instantiate() as Area2D
	objectInstance.position.x = lanes_list.pick_random()
	objectInstance.position.y = -10
	add_child(objectInstance)
	$ObjectTimer.start()


#@onready var bg_mat: ShaderMaterial = $TextureRect.material
#
#@onready var colors: CanvasModulate = $CanvasModulate
#@onready var text: RichTextLabel = $RichTextLabel
#@export var object : PackedScene = preload("res://Characters/object.tscn")
#
#var game_running: bool
#var game_over: bool
#var scroll
#var scroll_speed: int = 2
#var screen_size: Vector2i
#var elapsed_time: float = 0.0
#var speed_multiplier: float = 1.0
#
#const MAX_MULTIPLIER: float = 5.0
#const TIME_TO_MAX_SPEED: float = 60.0
#
#
#func _ready():
	#game_running = false
	#game_over = false
	#scroll = 0
#
	#$ObjectTimer.stop()
	#
	#await get_tree().create_timer(3.0).timeout
	#start_game()
#
	#
#func start_game():
	#colors.color = Color(1, 1, 1, 1)
	#text.visible = false
	#
	#game_running = true
	#game_over = false
	#scroll = 0
	#$ObjectTimer.start()
#
#
#func _process(delta: float) -> void:
	#if !game_running:
		#return
	#elapsed_time += delta
	#var t : float = clamp(elapsed_time / TIME_TO_MAX_SPEED, 0.0, 1.0)
	#var multiplier : float = lerp(1.0, MAX_MULTIPLIER, t)
	#bg_mat.set_shader_parameter("speed_multiplier", multiplier)
#
#func _on_object_timer_timeout() -> void:
	#var lanes_list = [160, 320, 480]
	#var objectInstance: Area2D = object.instantiate() as Area2D
	#objectInstance.position.x = lanes_list.pick_random()
	#objectInstance.position.y = 0
	#
	#add_child(objectInstance)
	#objectInstance.call("set_speed_multiplier", speed_multiplier)
	#$ObjectTimer.start()
	#pass
#
	#
	#
#
	#
	#
	#
