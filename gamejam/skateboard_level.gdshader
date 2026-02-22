shader_type canvas_item;

uniform float base_speed = 0.10;

uniform float speed_multiplier = 1.0;

void vertex() {
	UV.x += TIME * base_speed * speed_multiplier;
}

void fragment() {
	// Called for every pixel the material is visible on.
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
