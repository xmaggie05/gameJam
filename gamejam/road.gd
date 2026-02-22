extends Node2D

@export var base_speed: float = 400.0

func _process(delta: float) -> void:
	position.y += base_speed * Global.speed_multiplier * delta

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
