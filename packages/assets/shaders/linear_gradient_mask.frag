#include <flutter/runtime_effect.glsl>

#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_progress;

out vec4 fragColor;

void main () {
    vec2 st = FlutterFragCoord().xy/u_resolution.xy;
    float y = st.y - 1.0 + u_progress * 3.0 ;
    float alpha = mix(1.0, 0.0, y);

    fragColor = vec4(0.0, 0.0, 0.0, alpha);
}
