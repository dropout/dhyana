import 'dart:typed_data';
import 'package:blurhash_dart/blurhash_dart.dart';
import 'package:image/image.dart';

String createBlurHash(Uint8List imageBytes, {
  int size = 32,
  int comp = 3,
}) {
  Image image = decodeImage(imageBytes)!;
  image = copyResizeCropSquare(image, size: size);
  BlurHash blurHash = BlurHash.encode(image, numCompX: comp, numCompY: comp);
  return blurHash.hash;
}
