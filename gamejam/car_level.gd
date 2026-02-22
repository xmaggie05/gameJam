extends Node2D

@onready var colors: CanvasModulate = $CanvasModulate
@onready var text: RichTextLabel = $RichTextLabel
@export var object : PackedScene = preload("res://Characters/object.tscn")

var game_running: bool
var game_over: bool
var scroll
var scroll_speed: int = 2
var screen_size: Vector2i


func _ready():
	game_running = false
	game_over = false
	scroll = 0

	$ObjectTimer.stop()
	
	await get_tree().create_timer(3.0).timeout
	start_game()

	
func start_game():
	colors.color = Color(1, 1, 1, 1)
	text.visible = false
	
	game_running = true
	game_over = false
	scroll = 0
	$ObjectTimer.start()

	


func _on_object_timer_timeout() -> void:
	var lanes_list = [160, 320, 480]
	var objectInstance = object.instantiate()
	objectInstance.position.x = lanes_list.pick_random()
	objectInstance.position.y = 0
	
	add_child(objectInstance)
	$ObjectTimer.start()
	pass

	
	

	
	
	
