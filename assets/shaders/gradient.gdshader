shader_type canvas_item;

uniform sampler2D gradient_texture : source_color;
uniform float speed : hint_range(-5.0, 5.0) = 1.0;
uniform float gradient_scale : hint_range(0.1, 5.0) = 1.0;
uniform bool horizontal = true;
uniform float blend_strength : hint_range(0.0, 1.0) = 0.5;

void fragment() {
	vec4 tex_color = texture(TEXTURE, UV);
	
	float coord = horizontal ? UV.x : UV.y;
	
	float t = fract(coord * gradient_scale + TIME * speed);
	
	vec4 grad = texture(gradient_texture, vec2(t, 0.5));
	
	vec3 final_rgb = mix(tex_color.rgb, grad.rgb, grad.a * blend_strength);
	
	COLOR = vec4(final_rgb, tex_color.a);
}