import 'package:image/image.dart' as img;

abstract interface class SafeImageDetectorFactory {
  Future<SafeImageDetector> create();
}

/// Abstract class defining the interface for NSFW detection services.
abstract interface class SafeImageDetector {

  /// Detects if the given image is safe (No nudity or adult content) to use or not.
  /// Returns a [ImageSafetyDetectionResult] containing the result of the detection.
  Future<ImageSafetyDetectionResult> detectImageSafety(img.Image image);

  /// Releases the resources used by the model, if any.
  void releaseModel();

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
