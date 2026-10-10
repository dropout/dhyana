import 'dart:ui' as ui;

import 'package:flutter/services.dart';

/// Generates a white radial-gradient sprite (soft glow) of [diameter] px.
/// [hardness] 0..1 moves the falloff start toward the edge.
Future<ui.Image> createSoftCircleImage({
  int diameter = 64,
  double hardness = 0,
}) {
  final r = diameter / 2;
  final recorder = ui.PictureRecorder();
  final canvas = ui.Canvas(recorder);
  final paint = ui.Paint()
    ..shader = ui.Gradient.radial(
      ui.Offset(r, r),
      r,
      const [ui.Color(0xFFFFFFFF), ui.Color(0x00FFFFFF)],
      [hardness.clamp(0.0, 0.99), 1.0],
    );
  canvas.drawCircle(ui.Offset(r, r), r, paint);
  return recorder.endRecording().toImage(diameter, diameter);
}

/// Decodes an image from [bundle] (defaults to [rootBundle]), e.g. a sprite sheet.
Future<ui.Image> loadAtlasImage(String assetPath, {AssetBundle? bundle}) async {
  final data = await (bundle ?? rootBundle).load(assetPath);
  final codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
  try {
    return (await codec.getNextFrame()).image;
  } finally {
    codec.dispose();
  }
}

/// Splits a `columns` x `rows` sprite sheet into frame rects, row-major.
List<ui.Rect> spriteSheetFrames(
  ui.Image image, {
  required int columns,
  required int rows,
}) {
  final w = image.width / columns, h = image.height / rows;
  return [
    for (var y = 0; y < rows; y++)
      for (var x = 0; x < columns; x++) ui.Rect.fromLTWH(x * w, y * h, w, h),
  ];
}
