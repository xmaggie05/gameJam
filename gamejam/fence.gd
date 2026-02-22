extends Area2D

@onready var speed = get_parent().get_node("grassBackground").backspeed
	
func _process(delta):
	position += Vector2.LEFT * speed * delta
	
func _on_body_entered(body): 
	if (body.name == "horse"):
		Global.stop_game()
		get_tree().change_scene_to_file("res://end_screen.tscn")
		


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
