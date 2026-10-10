import 'vector_field.dart';

/// Divergence-free swirling flow from the curl of a 3D noise potential.
///
/// Great for smoke, embers and fluid-like motion. Unlike a plain noise field,
/// particles never bunch up in sinks.
class CurlNoiseField extends VectorField {
  const CurlNoiseField({
    this.frequency = 0.01,
    this.amplitude = 1,
    this.timeScale = 0.2,
    this.seed = 0,
    this.planar = false,
  });

  /// Spatial frequency in cycles per px.
  final double frequency;

  /// Output magnitude is roughly this value.
  final double amplitude;

  /// How fast the field evolves, in noise units per second.
  final double timeScale;
  final int seed;

  /// Zero out dz for a field that only moves particles in the xy plane.
  final bool planar;

  static const double _eps = 0.01;

  @override
  void sample(double x, double y, double z, double time, FieldSample out) {
    final px = x * frequency + time * timeScale * 0.7;
    final py = y * frequency + time * timeScale * 0.3;
    final pz = z * frequency + time * timeScale * 0.5;

    // Three decorrelated potentials: seed offsets stand in for separate noise.
    double a(double x, double y, double z) => _noise(x, y, z, seed);
    double b(double x, double y, double z) => _noise(x, y, z, seed + 101);
    double c(double x, double y, double z) => _noise(x, y, z, seed + 257);

    const e = _eps, inv = 1 / (2 * _eps);
    final dcdy = (c(px, py + e, pz) - c(px, py - e, pz)) * inv;
    final dbdz = (b(px, py, pz + e) - b(px, py, pz - e)) * inv;
    final dadz = (a(px, py, pz + e) - a(px, py, pz - e)) * inv;
    final dcdx = (c(px + e, py, pz) - c(px - e, py, pz)) * inv;
    final dbdx = (b(px + e, py, pz) - b(px - e, py, pz)) * inv;
    final dady = (a(px, py + e, pz) - a(px, py - e, pz)) * inv;

    // Typical gradient magnitude of this noise is ~1.5.
    final k = amplitude / 1.5;
    out.dx = (dcdy - dbdz) * k;
    out.dy = (dadz - dcdx) * k;
    out.dz = planar ? 0 : (dbdx - dady) * k;
  }

  // Smooth value noise in [-1, 1].
  static double _noise(double x, double y, double z, int seed) {
    final xi = x.floor(), yi = y.floor(), zi = z.floor();
    final fx = _fade(x - xi), fy = _fade(y - yi), fz = _fade(z - zi);
    double h(int dx, int dy, int dz) => _hash(xi + dx, yi + dy, zi + dz, seed);
    double lerp(double a, double b, double t) => a + (b - a) * t;
    final x00 = lerp(h(0, 0, 0), h(1, 0, 0), fx);
    final x10 = lerp(h(0, 1, 0), h(1, 1, 0), fx);
    final x01 = lerp(h(0, 0, 1), h(1, 0, 1), fx);
    final x11 = lerp(h(0, 1, 1), h(1, 1, 1), fx);
    return lerp(lerp(x00, x10, fy), lerp(x01, x11, fy), fz);
  }

  static double _fade(double t) => t * t * t * (t * (t * 6 - 15) + 10);

  // Integer hash kept below 2^53 so it behaves identically on web.
  static double _hash(int x, int y, int z, int seed) {
    var h = (x * 73856093) ^ (y * 19349663) ^ (z * 83492791) ^ (seed * 2654435);
    h &= 0x7fffffff;
    h = ((h ^ (h >> 15)) * 48271) & 0x7fffffff;
    h = ((h ^ (h >> 13)) * 48271) & 0x7fffffff;
    return (h / 0x3fffffff) - 1;
  }
}
