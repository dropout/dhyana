import 'dart:typed_data';
import 'package:blurhash_dart/blurhash_dart.dart';
import 'package:image/image.dart';

String createBlurHash(Uint8List imageBytes) {
  Image image = decodeImage(imageBytes)!;
  image = copyResizeCropSquare(image, size: 32);
  BlurHash blurHash = BlurHash.encode(image, numCompX: 3, numCompY: 3);
  return blurHash.hash;
}
