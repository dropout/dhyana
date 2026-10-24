#version 460 core

precision mediump float;

#include <flutter/runtime_effect.glsl>

uniform vec2 uSize;
uniform vec4 uColorBegin;
uniform vec4 uColorEnd;
uniform float uExponent;


out vec4 fragColor;

void main() {
    // Normalize coordinates from 0.0 to 1.0 along the Y axis
    vec2 st = FlutterFragCoord().xy / uSize;
    
    // Calculate the exponential interpolation factor
    float t = clamp(st.y, 0.0, 1.0);
    float factor = pow(t, uExponent);
    
    // Smoothly interpolate between the two colors per pixel
    fragColor = mix(uColorBegin, uColorEnd, factor);
}