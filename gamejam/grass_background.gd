extends ParallaxBackground

var backspeed = 750

func _process(delta):
	scroll_base_offset -= Vector2(backspeed, 0) * delta
