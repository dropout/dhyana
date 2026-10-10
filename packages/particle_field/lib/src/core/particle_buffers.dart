import 'dart:typed_data';

/// Structure-of-arrays particle storage. Live particles occupy `[0, count)`.
///
/// 2D use simply leaves `pz` and `vz` at zero.
class ParticleBuffers {
  ParticleBuffers(this.capacity, {int customChannels = 0})
    : px = Float32List(capacity),
      py = Float32List(capacity),
      pz = Float32List(capacity),
      vx = Float32List(capacity),
      vy = Float32List(capacity),
      vz = Float32List(capacity),
      age = Float32List(capacity),
      life = Float32List(capacity),
      size = Float32List(capacity),
      rotation = Float32List(capacity),
      color = Uint32List(capacity),
      kind = Uint8List(capacity),
      custom = List.generate(customChannels, (_) => Float32List(capacity));

  final int capacity;
  final Float32List px, py, pz, vx, vy, vz;

  /// Seconds alive and total lifespan in seconds.
  final Float32List age, life;
  final Float32List size, rotation;

  /// Packed 0xAARRGGBB.
  final Uint32List color;

  /// User-defined category, usable as a mask bit (`1 << kind`).
  final Uint8List kind;

  /// Extra per-particle channels for custom behaviours and renderers.
  final List<Float32List> custom;

  int count = 0;

  bool get isFull => count >= capacity;

  /// Appends a particle and returns its index, or -1 when full.
  int add({
    double x = 0,
    double y = 0,
    double z = 0,
    double vx = 0,
    double vy = 0,
    double vz = 0,
    double life = 1,
    double size = 1,
    double rotation = 0,
    int color = 0xFFFFFFFF,
    int kind = 0,
  }) {
    if (count >= capacity) return -1;
    final i = count++;
    px[i] = x;
    py[i] = y;
    pz[i] = z;
    this.vx[i] = vx;
    this.vy[i] = vy;
    this.vz[i] = vz;
    age[i] = 0;
    this.life[i] = life;
    this.size[i] = size;
    this.rotation[i] = rotation;
    this.color[i] = color;
    this.kind[i] = kind;
    for (final c in custom) {
      c[i] = 0;
    }
    return i;
  }

  /// O(1) removal: the last live particle takes slot [i].
  void removeAt(int i) {
    assert(i >= 0 && i < count);
    final last = count - 1;
    if (i != last) {
      px[i] = px[last];
      py[i] = py[last];
      pz[i] = pz[last];
      vx[i] = vx[last];
      vy[i] = vy[last];
      vz[i] = vz[last];
      age[i] = age[last];
      life[i] = life[last];
      size[i] = size[last];
      rotation[i] = rotation[last];
      color[i] = color[last];
      kind[i] = kind[last];
      for (final c in custom) {
        c[i] = c[last];
      }
    }
    count = last;
  }

  void clear() => count = 0;
}
