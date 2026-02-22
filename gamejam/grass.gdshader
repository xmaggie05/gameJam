shader_type canvas_item;

uniform float base_speed = 0.25;

uniform float speed_multiplier = 1.0;

void vertex() {
	UV.y -= TIME * base_speed * speed_multiplier;
}

void fragment() {
   
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
