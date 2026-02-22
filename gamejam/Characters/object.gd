extends Area2D

@export var base_speed: float = 100.0
var speed: float = 0.0

func set_speed_multiplier(multiplier: float) -> void:
	speed = base_speed * multiplier


func _physics_process(delta: float) -> void:
	position.y += speed * delta


func _ready() -> void:
	if speed == 0.0:
		speed = base_speed

func _on_body_entered(body: Node2D) -> void:
	$"../Carhit".play()
	Global.deduct_points(100)
	get_tree().change_scene_to_file("res://horse_level.tscn")
