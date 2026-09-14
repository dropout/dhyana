#include <flutter/runtime_effect.glsl>

uniform sampler2D uTexture;
uniform sampler2D uDistortionMap;

uniform vec2 uSize;
uniform float uStrength;       // glass distortion strength

uniform float uBlurRadius;     // in pixels, 0 = no blur
uniform vec3 uTintColor;       // 0..1 rgb
uniform float uTintStrength;   // 0..1, 0 = no tint

uniform float uGenieStrength;  // spread ratio at the very top; 1.0 = no skew
uniform float uGeniePivotX;    // 0..1, x anchor the spread expands from

out vec4 fragColor;


// Dense-grid Gaussian blur around a UV; radius in normalized UV units.
// A 3x3 ring leaves large gaps between samples at big radii, which reads as
// blockiness; a 5x5 grid with true per-sample Gaussian weights fixes that.
vec4 blurSample(sampler2D tex, vec2 uv, vec2 radiusUV) {
  const int KRADIUS = 2; // grid spans [-2, 2] in both axes -> 25 taps
  const float SIGMA = 1.6; // falloff sharpness across the grid
  vec2 stepUV = radiusUV / float(KRADIUS);

  vec4 sum = vec4(0.0);
  float totalWeight = 0.0;
  for (int dy = -KRADIUS; dy <= KRADIUS; dy++) {
    for (int dx = -KRADIUS; dx <= KRADIUS; dx++) {
      float weight = exp(-float(dx * dx + dy * dy) / (2.0 * SIGMA * SIGMA));
      vec2 sampleUV = clamp(uv + vec2(float(dx), float(dy)) * stepUV, 0.0, 1.0);
      sum += texture(tex, sampleUV) * weight;
      totalWeight += weight;
    }
  }
  return sum / totalWeight;
}

// Multi-tap Gaussian blur around a UV, radius in normalized UV units.
// vec4 blurSample(sampler2D tex, vec2 uv, vec2 radiusUV) {
//   vec4 sum = vec4(0.0);
//   const int TAPS = 8;
//   // Fixed ring of offsets keeps this branch-free and cheap per pixel.
//   vec2 offsets[TAPS];
//   offsets[0] = vec2(-1.0, -1.0); offsets[1] = vec2(0.0, -1.0);
//   offsets[2] = vec2(1.0, -1.0);  offsets[3] = vec2(-1.0, 0.0);
//   offsets[4] = vec2(1.0, 0.0);   offsets[5] = vec2(-1.0, 1.0);
//   offsets[6] = vec2(0.0, 1.0);   offsets[7] = vec2(1.0, 1.0);

//   // Normalized 3x3 Gaussian kernel weights (1 2 1 / 2 4 2 / 1 2 1) / 16, matching offsets order above.
//   float weights[TAPS];
//   weights[0] = 0.0625; weights[1] = 0.125;
//   weights[2] = 0.0625; weights[3] = 0.125;
//   weights[4] = 0.125;  weights[5] = 0.0625;
//   weights[6] = 0.125;  weights[7] = 0.0625;
//   const float centerWeight = 0.25;

//   vec4 center = texture(tex, uv);
//   sum += center * centerWeight;
//   for (int i = 0; i < TAPS; i++) {
//     vec2 sampleUV = clamp(uv + offsets[i] * radiusUV, 0.0, 1.0);
//     sum += texture(tex, sampleUV) * weights[i];
//   }
//   return sum;
// }

void main() {
  vec2 st = FlutterFragCoord().xy / uSize;

  // Genie skew: compress the source sampling region near the top so it
  // fans out over the full width, reading as content widening upward.
  // Ratio is exactly 1:1 at the bottom and 1:uGenieStrength at the top.
  float upward = st.y; // 0 at top, 1 at bottom
  float spread = mix(uGenieStrength, 1.0, upward);
  vec2 genieUV = vec2(uGeniePivotX + (st.x - uGeniePivotX) / spread, st.y);
  genieUV = clamp(genieUV, 0.0, 1.0);

  // Glass distortion, sampled from the distortion map at the skewed UV.
//   vec4 map = texture(uDistortionMap, genieUV);
//   vec4 map = texture(uTexture, genieUV);
//   vec2 offset = (map.rg - 0.5) * uStrength;
//   vec2 distortedUV = clamp(genieUV + offset, 0.0, 1.0);

  // Configurable blur, radius given in pixels and converted to UV space.
  vec2 radiusUV = uBlurRadius / uSize;
  vec4 color = uBlurRadius > 0.0
      ? blurSample(uTexture, genieUV, radiusUV)
      : texture(uTexture, genieUV);

  // Configurable tint, applied last over the blurred/distorted result.
  color.rgb = mix(color.rgb, uTintColor, uTintStrength);

  fragColor = color;
}
