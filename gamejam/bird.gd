extends Area2D

func _on_body_entered(body):
	if (body.name == "Airplane"):
		get_tree().change_scene_to_file("res://car_level.tscn")

var speed: float = 250

func _physics_process(delta: float) -> void:
	position.x -= speed * delta
