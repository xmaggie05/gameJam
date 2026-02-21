extends Area2D

#func _on_detection_body_entered(body):
	#if body.is_on_group("horse"):
		#get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
@onready var speed = get_parent().get_node("grassBackground").backspeed
	
func _process(delta):
	position += Vector2.LEFT * speed * delta
func _on_body_entered(body) :
	if (body.name == "horse"):
		get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
