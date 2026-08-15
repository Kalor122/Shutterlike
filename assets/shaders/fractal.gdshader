shader_type canvas_item;

uniform bool use_gradient = true;
uniform sampler2D gradient;
uniform int repetitions = 500;
uniform float scale = 5;
uniform bool julia_set = false;
uniform vec2 z = vec2(0, 0);
uniform vec2 c = vec2(0, 0);

float get_mandelbrot_color(vec2 _c) { // This is the mandelbrot set.
	vec2 _z = z;
	float n = 0.0;
	for (; n < float(repetitions) && length(_z) < 2.0; n++) {
		float x = _z.x;
		float y = _z.y;
		_z = vec2(x*x - y*y, 2.0*x*y) + _c;
	}
	return n / float(repetitions);
}

float get_julia_color(vec2 _z) { // This is the julia set. _c and _z is swapped.
	vec2 _c = c;
	float n = 0.0;
	for (; n < float(repetitions) && length(_z) < 2.0; n++) {
		float x = _z.x;
		float y = _z.y;
		_z = vec2(x*x - y*y, 2.0*x*y) + _c;
	}
	return n / float(repetitions);
}

vec3 get_gradient_color(float position) {
    return texture(gradient, vec2(position, 0.5)).rgb;
}

float get_color(vec2 pos) {
	pos -= vec2(0.5);
	pos *= vec2(scale);
	if (julia_set) {
		return get_julia_color(pos);
	}
	return get_mandelbrot_color(pos);
}

void fragment() {
	float value = get_color(UV / TEXTURE_PIXEL_SIZE);
	vec3 color;
	if (use_gradient) {
		color = get_gradient_color(value);
	} else {
		if (abs(value-1.0) < 0.0001) {
			color = vec3(0.0);
		} else {
			color = vec3(value);
		}
	}
	COLOR.rgb = color;
}
