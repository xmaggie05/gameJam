extends ParallaxBackground

var backspeed = 200
func _process(delta):
	scroll_base_offset -= Vector2(backspeed, 0) * delta
