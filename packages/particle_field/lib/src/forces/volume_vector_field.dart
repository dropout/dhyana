import 'dart:math';
import 'dart:typed_data';

import 'vector_field.dart';

/// Box a [VolumeVectorField] covers, in particle space.
class VolumeBounds {
  const VolumeBounds(
    this.left,
    this.top,
    this.front,
    this.width,
    this.height,
    this.depth,
  );

  /// Centred box of the given size.
  const VolumeBounds.centered(this.width, this.height, this.depth)
    : left = -width / 2,
      top = -height / 2,
      front = -depth / 2;

  final double left, top, front, width, height, depth;
}

/// Trilinearly sampled 3D grid of vectors; zero outside [bounds].
class VolumeVectorField extends VectorField {
  VolumeVectorField({
    required this.bounds,
    required this.columns,
    required this.rows,
    required this.layers,
    required this.data,
  }) : assert(columns >= 2 && rows >= 2 && layers >= 2),
       assert(data.length == columns * rows * layers * 3);

  final VolumeBounds bounds;
  final int columns, rows, layers;

  /// Interleaved dx, dy, dz per cell; x varies fastest, then y, then z.
  final Float32List data;

  /// Samples [fn] at every grid node.
  factory VolumeVectorField.fromFunction({
    required VolumeBounds bounds,
    required int columns,
    required int rows,
    required int layers,
    required VectorFieldFunction fn,
    double time = 0,
  }) {
    final data = Float32List(columns * rows * layers * 3);
    final s = FieldSample();
    for (var k = 0; k < layers; k++) {
      for (var j = 0; j < rows; j++) {
        for (var i = 0; i < columns; i++) {
          s.dx = s.dy = s.dz = 0;
          fn(
            bounds.left + bounds.width * i / (columns - 1),
            bounds.top + bounds.height * j / (rows - 1),
            bounds.front + bounds.depth * k / (layers - 1),
            time,
            s,
          );
          final o = ((k * rows + j) * columns + i) * 3;
          data[o] = s.dx;
          data[o + 1] = s.dy;
          data[o + 2] = s.dz;
        }
      }
    }
    return VolumeVectorField(
      bounds: bounds,
      columns: columns,
      rows: rows,
      layers: layers,
      data: data,
    );
  }

  @override
  void sample(double x, double y, double z, double time, FieldSample out) {
    final u = (x - bounds.left) / bounds.width;
    final v = (y - bounds.top) / bounds.height;
    final w = (z - bounds.front) / bounds.depth;
    if (u < 0 || u > 1 || v < 0 || v > 1 || w < 0 || w > 1) {
      out.dx = out.dy = out.dz = 0;
      return;
    }
    final fx = u * (columns - 1), fy = v * (rows - 1), fz = w * (layers - 1);
    final x0 = min(fx.floor(), columns - 2);
    final y0 = min(fy.floor(), rows - 2);
    final z0 = min(fz.floor(), layers - 2);
    final tx = fx - x0, ty = fy - y0, tz = fz - z0;
    final sy = columns * 3, sz = columns * rows * 3;
    final base = z0 * sz + y0 * sy + x0 * 3;

    double comp(int c) {
      double at(int dx, int dy, int dz) =>
          data[base + dz * sz + dy * sy + dx * 3 + c];
      final c00 = at(0, 0, 0) * (1 - tx) + at(1, 0, 0) * tx;
      final c10 = at(0, 1, 0) * (1 - tx) + at(1, 1, 0) * tx;
      final c01 = at(0, 0, 1) * (1 - tx) + at(1, 0, 1) * tx;
      final c11 = at(0, 1, 1) * (1 - tx) + at(1, 1, 1) * tx;
      final c0 = c00 * (1 - ty) + c10 * ty;
      final c1 = c01 * (1 - ty) + c11 * ty;
      return c0 * (1 - tz) + c1 * tz;
    }

    out.dx = comp(0);
    out.dy = comp(1);
    out.dz = comp(2);
  }
}
