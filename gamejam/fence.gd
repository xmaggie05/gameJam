extends Area2D

const BASE_SPEED: float = 750.0

func _process(delta: float) -> void:
	position += Vector2.LEFT * BASE_SPEED * Global.speed_multiplier * delta

func _on_body_entered(body) -> void:
	if body.name == "horse":
		Global.deduct_points(100)
		Global.stop_game()
		get_tree().change_scene_to_file("res://end_screen.tscn")

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()

#@onready var speed = get_parent().get_node("grassBackground").backspeed
	#
#func _process(delta):
	#position += Vector2.LEFT * speed * delta
	#
#func _on_body_entered(body) :
	#if (body.name == "horse"):
		#get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
#
#
#func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	#queue_free()
	
