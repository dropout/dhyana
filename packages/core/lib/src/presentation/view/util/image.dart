import 'package:material_ui/material_ui.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart' show rootBundle, ByteData;


// Efficient way to build circular images, without clipping
Widget buildCircularImage(BuildContext context, ImageProvider imageProvider) {
  return DecoratedBox(
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
        image: imageProvider,
        fit: BoxFit.cover
      ),
    ),
  );
}

/// Helper function to load an image from assets into a ui.Image
Future<ui.Image> loadUiImage(String assetPath) async {
  // 1. Load the raw bytes from the asset bundle
  final ByteData data = await rootBundle.load(assetPath);
  
  // 2. Instantiate a codec to decode the image bytes
  final ui.Codec codec = await ui.instantiateImageCodec(
    data.buffer.asUint8List(),
  );
  
  // 3. Extract the first frame (the actual image)
  final ui.FrameInfo frameInfo = await codec.getNextFrame();
  return frameInfo.image;
}