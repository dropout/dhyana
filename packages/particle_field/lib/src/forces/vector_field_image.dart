import 'dart:ui' as ui;

import 'vector_field.dart';

/// Builds a [GridVectorField] from an image, either as a flow map
/// (red/green = dx/dy) or, when [heightmap] is set, from luminance.
Future<GridVectorField> gridVectorFieldFromImage(
  ui.Image image, {
  required FieldBounds bounds,
  double scale = 1,
  bool heightmap = false,
  HeightmapMode heightmapMode = HeightmapMode.curl,
}) async {
  final bytes = await image.toByteData(format: ui.ImageByteFormat.rawRgba);
  if (bytes == null) {
    throw StateError('Could not read pixels from image');
  }
  final rgba = bytes.buffer.asUint8List(
    bytes.offsetInBytes,
    bytes.lengthInBytes,
  );
  return heightmap
      ? GridVectorField.fromHeightmap(
          rgba: rgba,
          width: image.width,
          height: image.height,
          bounds: bounds,
          mode: heightmapMode,
          scale: scale,
        )
      : GridVectorField.fromFlowMap(
          rgba: rgba,
          width: image.width,
          height: image.height,
          bounds: bounds,
          scale: scale,
        );
}
