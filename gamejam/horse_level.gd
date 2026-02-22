extends Node2D

var obstacle = preload("res://fence.tscn")

func _ready():
	pass

func _on_fence_timer_timeout():
	var obs = obstacle.instantiate()
	obs.position = Vector2(719, 409)
	add_child(obs)
	

	
