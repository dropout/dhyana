#version 460 core

precision mediump float;

#include <flutter/runtime_effect.glsl>

uniform vec2 u_size;
uniform float u_scroll_offset;
uniform float u_seed;

out vec4 fragColor;

// Parchment color palette
const vec3 kBaseColor = vec3(0.953, 0.898, 0.671); // #f3e5ab (Ecru)
const vec3 kDarkColor = vec3(0.753, 0.619, 0.220); // #C09E38 (Ecre darker shade)
const vec3 kStainColor = kBaseColor * 0.5; // foxing/water-stain blotch tint
const vec3 kHighlightColor = mix(kBaseColor, vec3(1.0), 0.35); // small bright fleck

// Pseudo-random number generator
float random(vec2 st) {
    return fract(sin(dot(st.xy, vec2(12.9898, 78.233))) * 43758.5453123);
}

// Vector-valued hash, used to scatter Worley cell feature points
vec2 hash2(vec2 st) {
    vec2 p = vec2(
        dot(st, vec2(127.1, 311.7)),
        dot(st, vec2(269.5, 183.3))
    );
    return fract(sin(p) * 43758.5453123);
}

// Worley (cellular) noise: distance from st to the nearest scattered
// feature point in the surrounding 3x3 cells. Produces a fibrous look
// closer to real paper grain than value noise.
float worley(vec2 st) {
    vec2 cell = floor(st);
    vec2 local = fract(st);

    float minDist = 1.0;
    for (int y = -1; y <= 1; ++y) {
        for (int x = -1; x <= 1; ++x) {
            vec2 neighbor = vec2(float(x), float(y));
            vec2 point = hash2(cell + neighbor);
            float dist = length(neighbor + point - local);
            minDist = min(minDist, dist);
        }
    }
    return minDist;
}

// Fractional Brownian Motion (multi-layered noise)
float fbm(vec2 st) {
    float value = 0.0;
    float amplitude = 0.5;
    vec2 shift = vec2(100.0);
    // Rotate to reduce axial bias and make it look more organic
    mat2 rot = mat2(cos(0.5), sin(0.5), -sin(0.5), cos(0.50));

    for (int i = 0; i < 5; ++i) { // 5 layers of noise
        value += amplitude * worley(st);
        st = rot * st * 2.0 + shift;
        amplitude *= 0.5;
    }
    return value;
}

void main() {
    vec2 uv = FlutterFragCoord().xy / u_size;

    // Scale coordinate space for texture and add the continuous vertical scroll offset
    vec2 st = uv * 2.0;
    // st += vec2(u_seed * 13.37, u_seed * 71.13); // deterministic per-seed pattern offset
    st += vec2(u_seed * 13.37, u_seed * 11.13); // deterministic per-seed pattern offset
    // st.y += u_scroll_offset * 0.0005; // Slow down the scrolling effect

    // Generate base texture
    float n1 = fbm(st * 0.5);
    float n2 = fbm(st * 10.0); // Finer detail layer

    // vec3 color = mix(kDarkColor, kBaseColor, clamp(n1 + (n2 * 0.95), 0.0, 1.0));
    
    
    
    
    
    // Small sparse patches that highlight the base color, using the distance
    // to the nearest Worley feature point so each patch stays a small round fleck
    // float highlightDist = worley(st * 5.0);
    // float highlightMask = 1.0 - smoothstep(0.0, 0.05, highlightDist);
    // color = mix(color, kHighlightColor, highlightMask);




    // Mix colors based on noise layers
    // vec3 color = mix(kDarkColor, kBaseColor, clamp(n1 + (n2 * 0.95), 0.0, 1.0));
    vec3 color = mix(kDarkColor, kBaseColor, 0.5 + clamp(worley(st * 1.0), 0.5, 1.0));
    // vec3 color = mix(kDarkColor, kBaseColor, clamp(worley(st * 1.0), 0.0, 1.0));

    // vec3 color = vec3(worley(st));
    // color = mix(kDarkColor, kBaseColor, clamp(n1, 0.5, 1.0));
    // vec3 color = mix(kDarkColor, kBaseColor, clamp(0.5 + n1, 0.0, 1.0));

    // Layer 3: sparse, large-scale patch mask for rare foxing/water-stain blotches
    // float patchNoise = fbm(st * 5.5);
    // float patchMask = 1.0 - smoothstep(0.0, 0.05, patchNoise); // only the highest values pass
    // // // vec3 color = mix(kBaseColor, kStainColor, patchMask * 0.5);
    // color = mix(color, kHighlightColor, patchMask);

    // Add subtle high-frequency grain to simulate paper fiber
    float grain = random(uv * 150.0 + u_scroll_offset + u_seed) * 0.13;
    color -= grain;

    // Small sparse patches that highlight the base color, using the distance
    // to the nearest Worley feature point so each patch stays a small round fleck
    float highlightDist = worley(st * 2.0);
    float highlightMask = 1.0 - smoothstep(0.0, 0.03, highlightDist);
    color = mix(color, kHighlightColor, highlightMask);

    fragColor = vec4(color, 1.0);
}
