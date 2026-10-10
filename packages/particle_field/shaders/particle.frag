uniform sampler2D sprite;

in vec2 v_uv;
in vec4 v_color;

out vec4 frag_color;

void main() {
  // The sampled sprite is premultiplied, so tint and fade without
  // multiplying by its alpha again.
  vec4 t = texture(sprite, v_uv);
  frag_color = vec4(t.rgb * v_color.rgb * v_color.a, t.a * v_color.a);
}
