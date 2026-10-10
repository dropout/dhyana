import 'dart:math';
import 'dart:typed_data';

/// Mutable output of a [VectorField] sample.
class FieldSample {
  double dx = 0, dy = 0, dz = 0;
}

/// A vector field in particle space, optionally time-varying.
///
/// 2D fields ignore [z] and leave `dz` at zero.
abstract class VectorField {
  const VectorField();
  void sample(double x, double y, double z, double time, FieldSample out);
}

/// Writes the field value at (x, y, z, time) into [out].
typedef VectorFieldFunction = void Function(
  double x,
  double y,
  double z,
  double time,
  FieldSample out,
);

/// Planar variant of [VectorFieldFunction] that ignores z.
typedef PlanarVectorFieldFunction = void Function(
  double x,
  double y,
  double time,
  FieldSample out,
);

/// A [VectorField] defined by a function.
class FunctionVectorField extends VectorField {
  const FunctionVectorField(this.fn);

  /// Wraps a 2D function; z is ignored.
  FunctionVectorField.planar(PlanarVectorFieldFunction fn)
    : this((x, y, z, time, out) => fn(x, y, time, out));

  final VectorFieldFunction fn;

  @override
  void sample(double x, double y, double z, double time, FieldSample out) =>
      fn(x, y, z, time, out);
}

/// Region a [GridVectorField] covers, in particle space.
class FieldBounds {
  const FieldBounds(this.left, this.top, this.width, this.height);
  final double left, top, width, height;
}

/// How a heightmap becomes a vector field.
///
/// [gradient] points downhill; [curl] flows along contour lines.
enum HeightmapMode { gradient, curl }

/// Bilinearly sampled 2D grid of vectors in the xy plane; zero outside
/// [bounds]. The z coordinate is ignored.
class GridVectorField extends VectorField {
  GridVectorField({
    required this.bounds,
    required this.columns,
    required this.rows,
    required this.data,
  }) : assert(columns >= 2 && rows >= 2),
       assert(data.length == columns * rows * 2);

  final FieldBounds bounds;
  final int columns, rows;

  /// Interleaved dx, dy per cell, row-major.
  final Float32List data;

  /// Samples [fn] at every grid node.
  factory GridVectorField.fromFunction({
    required FieldBounds bounds,
    required int columns,
    required int rows,
    required PlanarVectorFieldFunction fn,
    double time = 0,
  }) {
    final data = Float32List(columns * rows * 2);
    final s = FieldSample();
    for (var j = 0; j < rows; j++) {
      for (var i = 0; i < columns; i++) {
        final x = bounds.left + bounds.width * i / (columns - 1);
        final y = bounds.top + bounds.height * j / (rows - 1);
        s.dx = s.dy = s.dz = 0;
        fn(x, y, time, s);
        final k = (j * columns + i) * 2;
        data[k] = s.dx;
        data[k + 1] = s.dy;
      }
    }
    return GridVectorField(
      bounds: bounds,
      columns: columns,
      rows: rows,
      data: data,
    );
  }

  /// Flow map: red = dx, green = dy, 128 = zero, scaled to ±[scale].
  factory GridVectorField.fromFlowMap({
    required Uint8List rgba,
    required int width,
    required int height,
    required FieldBounds bounds,
    double scale = 1,
  }) {
    assert(rgba.length >= width * height * 4);
    final data = Float32List(width * height * 2);
    for (var p = 0; p < width * height; p++) {
      data[p * 2] = (rgba[p * 4] - 127.5) / 127.5 * scale;
      data[p * 2 + 1] = (rgba[p * 4 + 1] - 127.5) / 127.5 * scale;
    }
    return GridVectorField(
      bounds: bounds,
      columns: width,
      rows: height,
      data: data,
    );
  }

  /// Luminance heightmap turned into a gradient (downhill) or curl field.
  factory GridVectorField.fromHeightmap({
    required Uint8List rgba,
    required int width,
    required int height,
    required FieldBounds bounds,
    HeightmapMode mode = HeightmapMode.curl,
    double scale = 1,
  }) {
    assert(rgba.length >= width * height * 4);
    double h(int x, int y) {
      x = x.clamp(0, width - 1);
      y = y.clamp(0, height - 1);
      final k = (y * width + x) * 4;
      return (0.2126 * rgba[k] + 0.7152 * rgba[k + 1] + 0.0722 * rgba[k + 2]) /
          255;
    }

    final data = Float32List(width * height * 2);
    for (var y = 0; y < height; y++) {
      for (var x = 0; x < width; x++) {
        final gx = (h(x + 1, y) - h(x - 1, y)) * 0.5 * scale;
        final gy = (h(x, y + 1) - h(x, y - 1)) * 0.5 * scale;
        final k = (y * width + x) * 2;
        if (mode == HeightmapMode.curl) {
          data[k] = gy;
          data[k + 1] = -gx;
        } else {
          data[k] = -gx;
          data[k + 1] = -gy;
        }
      }
    }
    return GridVectorField(
      bounds: bounds,
      columns: width,
      rows: height,
      data: data,
    );
  }

  @override
  void sample(double x, double y, double z, double time, FieldSample out) {
    final u = (x - bounds.left) / bounds.width;
    final v = (y - bounds.top) / bounds.height;
    if (u < 0 || u > 1 || v < 0 || v > 1) {
      out.dx = out.dy = out.dz = 0;
      return;
    }
    final fx = u * (columns - 1);
    final fy = v * (rows - 1);
    final x0 = min(fx.floor(), columns - 2);
    final y0 = min(fy.floor(), rows - 2);
    final tx = fx - x0, ty = fy - y0;
    final a = (y0 * columns + x0) * 2;
    final b = a + 2;
    final c = a + columns * 2;
    final d = c + 2;
    double mix(int o) =>
        (data[a + o] * (1 - tx) + data[b + o] * tx) * (1 - ty) +
        (data[c + o] * (1 - tx) + data[d + o] * tx) * ty;
    out.dx = mix(0);
    out.dy = mix(1);
    out.dz = 0;
  }
}
