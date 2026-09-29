#include <flutter/runtime_effect.glsl>

uniform vec2 uSize;
uniform vec4 uColor;      // Shadow color
uniform float uBlur;      // Blur radius
uniform float uRadius;    // Corner radius
uniform vec2 uOffset;     // Shadow offset (dx, dy)

out vec4 fragColor;

// Sample count for the blur (32 is highly performant; bump to 64 for massive blur radii)
const int SAMPLES = 128; 
const float GOLDEN_ANGLE = 2.39996323; // pi * (3 - sqrt(5))

// Pure binary shape check: Returns 1.0 if outside, 0.0 if inside.
// This calculates exact geometric boundaries, not a distance field gradient.
float isOutside(vec2 pos, vec2 halfSize, float radius) {
    vec2 d = abs(pos) - halfSize + radius;
    return length(max(d, 0.0)) > radius ? 1.0 : 0.0;
}

float hash(vec2 p) {
    return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453);
}

float organicNoise(vec2 p) {
    vec2 cell = floor(p);
    vec2 local = smoothstep(0.0, 1.0, fract(p));
    float bottom = mix(hash(cell), hash(cell + vec2(1.0, 0.0)), local.x);
    float top = mix(hash(cell + vec2(0.0, 1.0)), hash(cell + vec2(1.0)), local.x);
    return mix(bottom, top, local.y);
}

void main() {
    vec2 st = FlutterFragCoord().xy;
    vec2 halfSize = uSize * 0.5;
    vec2 pos = st - halfSize;

    // 2. Convolution: True Blur Simulation
    float shadowIntensity = 0.0;
    vec2 shadowPos = pos - uOffset;

    for (int i = 0; i < SAMPLES; i++) {
        // Distribute sample points uniformly in a circular area
        float theta = float(i) * GOLDEN_ANGLE;
        float r = sqrt(float(i) + 0.5) / sqrt(float(SAMPLES));
        
        vec2 sampleOffset = vec2(cos(theta), sin(theta)) * (r * uBlur);
        vec2 samplePoint = shadowPos + sampleOffset;
        
        // Tally how much of the blur kernel lands OUTSIDE the boundary
        shadowIntensity += isOutside(samplePoint, halfSize, uRadius);
    }

    // Average the samples to get perfect shadow opacity
    float shadowAlpha = shadowIntensity / float(SAMPLES);
    float noise = organicNoise(pos * 0.57);
    shadowAlpha *= mix(0.94, 1.06, noise);

    // Apply color, opacity, and clip to panel bounds
    fragColor = uColor * shadowAlpha;
}