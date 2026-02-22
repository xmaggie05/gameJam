extends StaticBody2D

const BASE_SPEED: float = 400.0

func set_width(w: float) -> void:
	var shape = $CollisionShape2D.shape as RectangleShape2D
	shape.size.x = w
	$Sprite2D.scale.x = w / $Sprite2D.texture.get_width()
	$CollisionShape2D.position.x = w / 2.0

func _process(delta: float) -> void:
	position.x -= BASE_SPEED * Global.speed_multiplier * delta

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
