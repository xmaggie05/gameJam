extends Area2D

var speed: float = 250

func _physics_process(delta: float) -> void:
	position.y += speed * delta


func _on_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
