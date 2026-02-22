extends Area2D

@export var base_speed: float = 300.0

func _physics_process(delta: float) -> void:
	position.x -= base_speed * GameState.speed_multiplier * delta

func _on_body_entered(body: Node) -> void:
	if body.name == "Airplane":
		get_tree().change_scene_to_file("res://car_level.tscn")

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
	
#@export var base_speed: float = 300.0
#var speed: float = 0.0
#
#func set_speed_multiplier(multiplier: float) -> void:
	#speed = base_speed * multiplier
#
#func _on_body_entered(body):
	#if (body.name == "Airplane"):
		#get_tree().change_scene_to_file("res://car_level.tscn")
#
#
#func _physics_process(delta: float) -> void:
	#position.x -= speed * delta
#
#
#func _ready() -> void:
	#if speed == 0.0:
		#speed = base_speed
