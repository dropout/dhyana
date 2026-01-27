import 'package:image/image.dart' as img;

/// Abstract class defining the interface for NSFW detection services.
abstract interface class SafeImageDetectorService {

  /// Detects if the given image is safe (No nudity or adult content) to use or not.
  /// Returns a [ImageSafetyDetectionResult] containing the result of the detection.
  Future<ImageSafetyDetectionResult> detectImageSafety(img.Image image);

}

/// Stores the results of the NSFW detection.
class ImageSafetyDetectionResult {

  /// Indicates if the image content is safe
  final bool isSafe;

  /// The score for the image
  final double score;

  /// Default constructor for creating an instance.
  ImageSafetyDetectionResult(this.isSafe, this.score);

}
