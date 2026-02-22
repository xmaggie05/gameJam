extends Area2D

var speed: float = 190

func _physics_process(delta: float) -> void:
	position.y += speed * delta


func _on_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://horse_level.tscn")
