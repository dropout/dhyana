// Camera-facing billboard, expanded from per-instance data.
uniform FrameInfo {
  vec4 eye;
  vec4 right;
  vec4 up;
  vec4 forward;
  // x: focal length px, y: orthographic scale (0 = perspective), z: near, w: far
  vec4 lens;
  // x, y: half viewport size px; z, w: principal point offset from centre px
  vec4 view;
}
frame;

in vec2 corner;
in vec4 center_size;
in vec4 color;
in float rotation;

out vec2 v_uv;
out vec4 v_color;

void main() {
  vec3 d = center_size.xyz - frame.eye.xyz;
  float zc = dot(d, frame.forward.xyz);
  float xc = dot(d, frame.right.xyz);
  float yc = dot(d, frame.up.xyz);
  float s = frame.lens.y > 0.0 ? frame.lens.y : frame.lens.x / max(zc, 1e-4);

  float c = cos(rotation);
  float sn = sin(rotation);
  vec2 off = corner * (center_size.w * 0.5 * s);
  vec2 rotated = vec2(c * off.x - sn * off.y, sn * off.x + c * off.y);
  vec2 screen = vec2(xc * s, -yc * s) + rotated;

  bool visible = zc >= frame.lens.z && zc <= frame.lens.w;
  float depth = clamp((zc - frame.lens.z) / (frame.lens.w - frame.lens.z), 0.0, 1.0);
  gl_Position = visible
      ? vec4((screen.x + frame.view.z) / frame.view.x,
             -(screen.y + frame.view.w) / frame.view.y, depth, 1.0)
      : vec4(2.0, 2.0, 2.0, 1.0);
  v_uv = corner * 0.5 + 0.5;
  v_color = color;
}
