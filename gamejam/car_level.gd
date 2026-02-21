extends Node2D

@export var object : PackedScene = preload("res://Characters/object.tscn")

var game_running: bool
var game_over: bool
var scroll
var scroll_speed: int = 2
var screen_size: Vector2i


func _ready():
	screen_size = get_window().size
	start_game()
	
func start_game():
	game_running = true
	game_over = false
	scroll = 0

	
func _process(delta: float):
	if game_running:
		scroll += scroll_speed
		if scroll >= screen_size.y:
			scroll = 0
		$Road.position.y = +scroll
		$Road2.position.y = +scroll
		$Road3.position.y = +scroll


func _on_object_timer_timeout() -> void:
	var lanes_list = [160, 320, 480]
	var objectInstance = object.instantiate()
	objectInstance.position.x = lanes_list.pick_random()
	objectInstance.position.y = 0
	
	add_child(objectInstance)
	$ObjectTimer.start()
	pass

	
	

	
	
	
