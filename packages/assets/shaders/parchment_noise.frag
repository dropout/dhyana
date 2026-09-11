#version 460 core

precision mediump float;

#include <flutter/runtime_effect.glsl>

uniform vec2 u_size;
uniform float u_scroll_offset;

out vec4 fragColor;

// Pseudo-random number generator
float random(vec2 st) {
    return fract(sin(dot(st.xy, vec2(12.9898, 78.233))) * 43758.5453123);
}

// 2D Value Noise
float noise(vec2 st) {
    vec2 i = floor(st);
    vec2 f = fract(st);

    float a = random(i);
    float b = random(i + vec2(1.0, 0.0));
    float c = random(i + vec2(0.0, 1.0));
    float d = random(i + vec2(1.0, 1.0));

    // Smooth interpolation
    vec2 u = f * f * (3.0 - 2.0 * f);
    return mix(a, b, u.x) + (c - a) * u.y * (1.0 - u.x) + (d - b) * u.x * u.y;
}

// Fractional Brownian Motion (multi-layered noise)
float fbm(vec2 st) {
    float value = 0.0;
    float amplitude = 0.5;
    vec2 shift = vec2(100.0);
    // Rotate to reduce axial bias and make it look more organic
    mat2 rot = mat2(cos(0.5), sin(0.5), -sin(0.5), cos(0.50));

    for (int i = 0; i < 5; ++i) { // 5 layers of noise
        value += amplitude * noise(st);
        st = rot * st * 2.0 + shift;
        amplitude *= 0.5;
    }
    return value;
}

void main() {
    vec2 uv = FlutterFragCoord().xy / u_size;

    // Scale coordinate space for texture and add the continuous vertical scroll offset
    vec2 st = uv * 3.0;
    st.y += u_scroll_offset * 0.0005; // Slow down the scrolling effect

    // Generate base texture
    float n1 = fbm(st * 2.0);
    float n2 = fbm(st * 5.0); // Finer detail layer

    // Ecru / parchment color palette
    vec3 baseColor = vec3(0.953, 0.898, 0.671); // #F3E5AB (Ecru)
    vec3 darkColor = vec3(0.760, 0.700, 0.502); // #C2B280 (darker parchment variation)

    // Mix colors based on noise layers
    vec3 color = mix(darkColor, baseColor, n1 + (n2 * 0.2));

    // Add subtle high-frequency grain to simulate paper fiber
    float grain = random(uv * 150.0 + u_scroll_offset) * 0.03;
    color -= grain;

    fragColor = vec4(color, 1.0);
}
