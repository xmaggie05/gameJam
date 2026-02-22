extends Control

@onready var button: TextureButton = $start

var speed: float
const start_speed = 10.0
const score_modifier: int = 10
var score = 0

func _ready() -> void:
	pass 
func _progress(delta):
	pass
	#if game_running:
		#speed = start_speed + score / speed_modifier
		#if speed > max_speed:
			#speed = max_speed
	
func _on_button_pressed() -> void:
	print("hello")
	Global.start_game()
	Global.pause_for_seconds(3)
	get_tree().change_scene_to_file("res://Levels/airplane_level.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
