#version 330 compatibility

uniform bool is_hurt;
uniform bool is_on_ground;
uniform float frameTimeCounter;


out vec2 texcoord;
out vec3 normal;

float shake;

void main() {
	gl_Position = ftransform();
	texcoord = (gl_TextureMatrix[0] * gl_MultiTexCoord0).xy;


	if (!is_on_ground) {
		shake = sin(frameTimeCounter * 30) * 0.01;

		gl_Position.x += shake;

	}

	
	
}