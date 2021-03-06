#version 330 core
in vec3 fragment_pos;
in vec3 normal;
in vec2 texture_coord;

out vec4 Frag_color;

struct Light {
    vec3 position;
    vec3 color;
};

uniform Light light;
uniform sampler2D texture_diffuse1;

void main()
{
	vec3  norm = normalize(normal);
    vec3  light_dir = normalize(light.position - fragment_pos);
    float angle = max(dot(norm, light_dir), 0.0);
    vec3  diffuse = light.color * angle * texture(texture_diffuse1, texture_coord).rgb;

    Frag_color = vec4(diffuse * vec3(0.5, 0.5, 0.5), 1.0);
}
