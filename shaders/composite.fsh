#version 330 compatibility

uniform sampler2D colortex0;
uniform sampler2D lightmap;

uniform float playerMood;
uniform float frameTimeCounter;
uniform float currentPlayerAir;
uniform float currentPlayerHealth;

in vec2 texcoord;
in vec4 glcolor;

/* RENDERTARGETS: 0 */
layout(location = 0) out vec3 color;

float grain;
float noise;
float grainStrength;
vec2 seed;

float random(vec2 st) {
	return fract(sin(dot(st, vec2(12.9898, 78.233))) * 43758.5453);

}

void main() {
	color = texture2D(colortex0, texcoord).rgb;

	float brightness = dot(color.rgb, vec3(0.299, 0.587, 0.114));
	float darkness = 1 - smoothstep(0.3, 0.7, brightness);

	color.rgb *= currentPlayerAir;

	seed = texcoord / 100 + vec2(frameTimeCounter * 10);

	grainStrength = playerMood * darkness;
	grain = random(seed) - 0.5;
	color.rgb += grain * grainStrength * 0.15;
	



	



}