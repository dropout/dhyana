#version 460 core
precision mediump float;

out vec4 fragColor;

// For testing purposes, cannot stub a fragment shader???
void main() {
    fragColor = vec4(1.0, 0.0, 0.0, 1.0); // Red color
}
