import 'package:flutter/foundation.dart';
import 'package:flutter_litert/flutter_litert.dart';
import 'package:image/image.dart' as img;

import 'package:core/core.dart';

class DefaultSafeImageDetectorFactory implements SafeImageDetectorFactory {
  /// Path to the TFLite model
  static const _kModelPath = 'assets/gantman_nswf_110.tflite';

  /// Default threshold for classifying NSFW content
  static const _kNSFWThreshold = 0.7;

  /// Threshold for NSFW classification
  final double threshold;

  const DefaultSafeImageDetectorFactory({this.threshold = _kNSFWThreshold});

  @override
  Future<SafeImageDetector> create() async {
    final interpreter = await Interpreter.fromAsset(_kModelPath);    
    return DefaultSafeImageDetector(
      interpreter: interpreter,
      threshold: threshold,
    );
  }
}

class DefaultSafeImageDetector with LoggerMixin implements SafeImageDetector {
  final Interpreter _interpreter;
  final double _threshold;

  DefaultSafeImageDetector({
    required this._interpreter,
    this._threshold = 0.7,
  });

  @override
  Future<ImageSafetyDetectionResult> detectImageSafety(img.Image image) async {
    
    // 1. Resize the image to the required input size for the model
    final resizedImage = img.copyResize(image, width: 224, height: 224);

    // 2. Normalize RGB pixels into input tensor standard shape [1, 224, 224, 3]
    var input = List.generate(
      1,
      (_) => List.generate(
        224,
        (y) => List.generate(
          224,
          (x) {
            final pixel = resizedImage.getPixel(x, y);
            return [
              pixel.r / 255.0,
              pixel.g / 255.0,
              pixel.b / 255.0,
            ];
          },
        ),
      ),
    );

    // 3. Prepare output tensor placeholder matching model label shape
    final labels = ['neutral', 'porn', 'hentai', 'sexy'];
    var output = List.filled(1 * labels.length, 0.0).reshape([1, labels.length]);

    // 4. Run inference
    _interpreter.run(input, output);

    // 5. Parse top label result
    final results = List<double>.from(output[0]);
    int maxIndex = 0;
    double maxScore = results[0];

    for (int i = 1; i < results.length; i++) {
      if (results[i] > maxScore) {
        maxScore = results[i];
        maxIndex = i;
      }
    }

    debugPrint('Detected label: ${labels[maxIndex]} with score: $maxScore');

    // 6. Return ImageSafetyDetectionResult based on threshold
    final isSafe = maxScore < _threshold;
    return ImageSafetyDetectionResult(isSafe, maxScore);
  }

  @override
  void dispose() {
    _interpreter.close();
  }
}

// /// NsfwDetector class handles the NSFW detection process.
// class DefaultSafeImageDetector with LoggerMixin implements SafeImageDetector {
//   /// Defines the mean values for each channel,
//   /// used in the Visual Geometry Group model.
//   /// These values are used for preprocessing input images.
//   static const _redMean = 123.68;
//   static const _greenMean = 116.779;
//   static const _blueMean = 103.939;

//   /// Default input width for the model
//   static const _kInputWidth = 224;

//   /// Default input height for the model
//   static const _kInputHeight = 224;

//   /// Interpreter for running the TFLite model
//   final Interpreter _interpreter;

//   /// Threshold for NSFW classification
//   final double _threshold;

//   DefaultSafeImageDetector._({
//     required this._interpreter,
//     required this._threshold,
//   });

//   @visibleForTesting
//   DefaultSafeImageDetector.forTest({
//     required this._interpreter,
//     required this._threshold,
//   });

//   /// Detects NSFW content from an image
//   @override
//   Future<ImageSafetyDetectionResult> detectImageSafety(img.Image image) async {
//     // Resize the image to the required input size for the model
//     img.Image resizedImage = img.copyResize(
//       image,
//       width: _kInputWidth,
//       height: _kInputHeight,
//     );

//     // Convert the image to a normalized byte list
//     Uint8List input = _toNormalizedByteList(resizedImage);

//     // List.filled(2, 0.0).reshape([1, 2]) produces a [[0.0, 0.0]] output
//     // structure matching the model output shape expected by Interpreter.run().
//     // .reshape is a convenience extension method provided by tflite_flutter package.
//     final modelOutput = List.filled(2, 0.0).reshape([1, 2]);

//     // Run the model inference
//     _interpreter.run(input, modelOutput);

//     // Extract the score from the model output
//     List<double> result = modelOutput.first ?? [];
//     double? score;
//     if (result.length == 2) {
//       score = result[1];
//     }

//     if (score == null) {
//       throw const SafeImageDetectionException(
//         'Failed to get a valid score from the model output.',
//       );
//     }

//     logger.t(
//       'NSFW detection score: $score, passed threshold: ${score < _threshold}',
//     );
//     return ImageSafetyDetectionResult(score < _threshold, score);
//   }

//   /// Converts an image to a byte list suitable for the model input
//   /// and normalizes the pixel values by subtracting the mean values.
//   Uint8List _toNormalizedByteList(img.Image image) {
//     final buffer = Uint8List(_kInputWidth * _kInputHeight * 3 * 4);
//     final byteBuffer = buffer.buffer;
//     final imgData = Float32List.view(byteBuffer);

//     int index = 0;
//     for (var i = 0; i < _kInputHeight; i++) {
//       for (var j = 0; j < _kInputWidth; j++) {
//         var pixel = image.getPixel(j, i);
//         imgData[index++] = (pixel.b - _blueMean).toDouble();
//         imgData[index++] = (pixel.g - _greenMean).toDouble();
//         imgData[index++] = (pixel.r - _redMean).toDouble();
//       }
//     }
//     return buffer;
//   }

//   /// Closes the interpreter to release resources
//   @override
//   void dispose() {
//     _interpreter.close();
//   }
// }
