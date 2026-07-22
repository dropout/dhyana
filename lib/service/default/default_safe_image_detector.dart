import 'dart:typed_data';

import 'package:dhyana/util/logger_mixin.dart';
import 'package:image/image.dart' as img;
import 'package:tflite_flutter/tflite_flutter.dart';

import 'package:dhyana/service/safe_image_detector.dart';

class DefaultSafeImageDetectorFactory implements SafeImageDetectorFactory {
  /// Path to the TFLite model
  static const _kModelPath = 'assets/nsfw.tflite';

  /// Default threshold for classifying NSFW content
  static const _kNSFWThreshold = 0.7;

  /// Threshold for NSFW classification
  final double threshold;

  const DefaultSafeImageDetectorFactory({
    this.threshold = _kNSFWThreshold,
  });

  @override
  Future<SafeImageDetector> create() async {
    final interpreter = await Interpreter.fromAsset(_kModelPath);
    return DefaultSafeImageDetector._(
      interpreter: interpreter,
      threshold: threshold,
    );
  }
}

/// NsfwDetector class handles the NSFW detection process.
class DefaultSafeImageDetector with LoggerMixin implements SafeImageDetector {
  /// Defines the mean values for each channel,
  /// used in the Visual Geometry Group model.
  /// These values are used for preprocessing input images.
  static const _redMean = 123.68;
  static const _greenMean = 116.779;
  static const _blueMean = 103.939;

  /// Default input width for the model
  static const _kInputWidth = 224;

  /// Default input height for the model
  static const _kInputHeight = 224;

  /// Interpreter for running the TFLite model
  final Interpreter _interpreter;

  /// Threshold for NSFW classification
  final double _threshold;

  DefaultSafeImageDetector._({
    required Interpreter interpreter,
    required double threshold,
  }) : _interpreter = interpreter,
       _threshold = threshold;

  /// Detects NSFW content from an image
  @override
  Future<ImageSafetyDetectionResult> detectImageSafety(img.Image image) async {
    // Resize the image to the required input size for the model
    img.Image resizedImage = img.copyResize(
      image,
      width: _kInputWidth,
      height: _kInputHeight,
    );

    // Convert the image to a normalized byte list
    Uint8List input = _toNormalizedByteList(resizedImage);

    // List.filled(2, 0.0).reshape([1, 2]) produces a [[0.0, 0.0]] output
    // structure matching the model output shape expected by Interpreter.run().
    // .reshape is a convenience extension method provided by tflite_flutter package.
    final modelOutput = List.filled(2, 0.0).reshape([1, 2]);

    // Run the model inference
    _interpreter.run(input, modelOutput);

    // Extract the score from the model output
    List<double> result = modelOutput.first ?? [];
    double? score;
    if (result.length == 2) {
      score = result[1];
    }

    if (score == null) {
      throw Exception('Failed to get a valid score from the model output.');
    }

    logger.t('NSFW detection score: $score, passed threshold: ${score < _threshold}');
    return ImageSafetyDetectionResult(score < _threshold, score);
  }

  /// Converts an image to a byte list suitable for the model input
  /// and normalizes the pixel values by subtracting the mean values.
  Uint8List _toNormalizedByteList(img.Image image) {
    final buffer = Uint8List(_kInputWidth * _kInputHeight * 3 * 4);
    final byteBuffer = buffer.buffer;
    final imgData = Float32List.view(byteBuffer);

    int index = 0;
    for (var i = 0; i < _kInputHeight; i++) {
      for (var j = 0; j < _kInputWidth; j++) {
        var pixel = image.getPixel(j, i);
        imgData[index++] = (pixel.b - _blueMean).toDouble();
        imgData[index++] = (pixel.g - _greenMean).toDouble();
        imgData[index++] = (pixel.r - _redMean).toDouble();
      }
    }
    return buffer;
  }

  /// Closes the interpreter to release resources
  @override
  void releaseModel() {
    _interpreter.close();
  }
}
