import 'package:assets/assets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_litert/flutter_litert.dart';
import 'package:image/image.dart' as img;

import 'package:core/core.dart';

class DefaultSafeImageDetectorFactory implements SafeImageDetectorFactory {
  /// Path to the TFLite model
  static const _kModelPath = Assets.nswfModel;

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
  /// Output class order of the GantMan model.
  static const _kLabels = ['drawings', 'hentai', 'neutral', 'porn', 'sexy'];

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

    // 3. Output tensor must match the model's class count (5 for GantMan)
    final labels = _kLabels;
    var output = List.filled(labels.length, 0.0).reshape([1, labels.length]);

    // 4. Run inference
    _interpreter.run(input, output);

    // 5. NSFW score is the combined probability of explicit classes
    final results = List<double>.from(output[0]);
    double scoreOf(String label) => results[labels.indexOf(label)];
    final nsfwScore = scoreOf('porn') + scoreOf('hentai') + scoreOf('sexy');

    debugPrint('NSFW score: $nsfwScore, scores: $results');

    // 6. Return ImageSafetyDetectionResult based on threshold
    return ImageSafetyDetectionResult(nsfwScore < _threshold, nsfwScore);
  }

  @override
  void dispose() {
    _interpreter.close();
  }
}
