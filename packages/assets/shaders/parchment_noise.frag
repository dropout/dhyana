#version 460 core

precision mediump float;

#include <flutter/runtime_effect.glsl>

uniform vec2 u_size;
uniform float u_scroll_offset;
uniform float u_seed;

out vec4 fragColor;

// Parchment color palette
const vec3 kBaseColor = vec3(0.953, 0.898, 0.671); // #f3e5ab (Ecru)
const vec3 kDarkColor = vec3(0.843, 0.745, 0.459); // #D7BE75 (Ecru darker shade)
const vec3 kStainColor = kBaseColor * 0.5; // foxing/water-stain blotch tint
const vec3 kHighlightColor = mix(kBaseColor, vec3(1.0), 0.15); // small bright fleck
const vec3 kFiberColor = kDarkColor * 0.7; // embedded plant-fiber speck

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

// Sparse, hard-edged fibers: each Worley cell may contain a short randomly
// oriented sliver, mimicking plant-fiber residue visible in handmade paper.
float fiberField(vec2 st) {
    vec2 cell = floor(st);
    vec2 local = fract(st) - 0.5;

    float coverage = 0.0;
    for (int y = -1; y <= 1; ++y) {
        for (int x = -1; x <= 1; ++x) {
            vec2 neighbor = vec2(float(x), float(y));
            vec2 id = cell + neighbor;

            // Only a sparse fraction of cells actually contain a visible fiber
            float visible = step(random(id + 11.0), 0.01);

            vec2 center = hash2(id) - 0.5; // random position within the cell
            float angle = random(id + 5.0) * 6.28318;
            float fiberLen = 0.25 + random(id + 9.0) * 0.55;
            float fiberWidth = 0.02 + random(id + 13.0) * 0.01;

            vec2 p = (local - neighbor) - center;
            float c = cos(angle);
            float s = sin(angle);
            vec2 rotated = vec2(c * p.x + s * p.y, -s * p.x + c * p.y);

            // Bend the centerline with a slow sine wave so the strand curls
            // instead of running ruler-straight
            float waveFreq = 4.0 + random(id + 17.0) * 5.0;
            float waveAmp = fiberWidth * (1.5 + random(id + 19.0) * 2.5);
            float bend = sin(rotated.x * waveFreq + random(id + 21.0) * 6.28318) * waveAmp;

            // Taper the width toward the tips for a pointed, organic strand shape
            float taper = 1.0 - smoothstep(fiberLen * 0.6, fiberLen, abs(rotated.x));
            float localWidth = fiberWidth * mix(0.35, 1.0, taper);

            // Soft edges (smoothstep instead of a hard step) keep the fiber subtle
            float edge = 0.015;
            float inLength = 1.0 - smoothstep(fiberLen, fiberLen + edge, abs(rotated.x));
            float inWidth = 1.0 - smoothstep(localWidth, localWidth + edge, abs(rotated.y - bend));
            coverage = max(coverage, inLength * inWidth * visible);
        }
    }
    return coverage;
}

void main() {
    vec2 uv = FlutterFragCoord().xy / u_size;

    // Scale coordinate space for texture and add the continuous vertical scroll offset
    vec2 st = uv * 2.0;
    st += vec2(u_seed * 13.37, u_seed * 71.13); // deterministic per-seed pattern offset
    st.y += u_scroll_offset * 0.0005; // Slow down the scrolling effect

    // Generate base texture
    float n1 = fbm(st * 0.5);
    float n2 = fbm(st * 10.0); // Finer detail layer

    // Mix colors based on noise layers
    vec3 color = mix(kDarkColor, kBaseColor, clamp(worley(st * 1.0), 0.0, 1.0));

    // Sparse, large-scale patch mask for rare foxing/water-stain blotches
    float patchNoise = fbm(st * 1.5);
    float patchMask = smoothstep(0.5, 0.6, patchNoise); // only the highest values pass
    color = mix(color, kDarkColor, clamp(patchMask, 0.0, .25));

    // Small sparse patches that highlight the base color, using the distance
    // to the nearest Worley feature point so each patch stays a small round fleck
    // float highlightDist = worley(st * 2.0);
    float highlightDist = fbm(st * 5.5);
    float highlightMask = 1.0 - smoothstep(0.1, 0.15, highlightDist);
    color = mix(color, kHighlightColor, highlightMask);

    // Plant-fiber residue: sparse, sharp-edged slivers scattered across the surface
    float fiberCoverage = fiberField(st * 12.0);
    color = mix(color, kFiberColor, fiberCoverage * 0.5);

    // Add subtle high-frequency grain to simulate paper fiber
    float grain = random(uv * 150.0 + u_scroll_offset + u_seed) * 0.13;
    color -= grain;

    fragColor = vec4(color, 1.0);
}
