import 'dart:typed_data';
import 'dart:ui';

import 'package:core/src/infrastructure/platform/default_safe_image_detector.dart';
import 'package:core/src/testing/mock_definitions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:image/image.dart' as img;
import 'package:mocktail/mocktail.dart';

void main() {
  late MockImageLabeler labeler;
  late DefaultSafeImageDetector detector;

  setUpAll(() {
    registerFallbackValue(
      InputImage.fromBytes(
        bytes: Uint8List.fromList([0, 0, 0, 0]),
        metadata: InputImageMetadata(
          size: const Size(2, 2),
          rotation: InputImageRotation.rotation0deg,
          format: InputImageFormat.nv21,
          bytesPerRow: 2,
        ),
      ),
    );
  });


  setUp(() {
    labeler = MockImageLabeler();
    detector = DefaultSafeImageDetector(imageLabeler: labeler, threshold: 0.7);
  });

  group('DefaultSafeImageDetector.detectImageSafety', () {
    test('returns safe result when score is below threshold', () async {
      when(() => labeler.processImage(any())).thenAnswer((_) {
        return Future.value([
          ImageLabel(index: 0, label: 'sexy', confidence: 0.2),
        ]);
      });

      final result = await detector.detectImageSafety(_sampleImage);

      expect(result.isSafe, isTrue);
      expect(result.score, equals(1.0));
      verify(() => labeler.processImage(any())).called(1);
    });

    test('returns unsafe result when score is above threshold', () async {
      when(() => labeler.processImage(any())).thenAnswer((_) {
        return Future.value([
          ImageLabel(index: 0, label: 'sexy', confidence: 0.9),
        ]);
      });

      final result = await detector.detectImageSafety(_sampleImage);

      expect(result.isSafe, isFalse);
      expect(result.score, equals(0.9));
      verify(() => labeler.processImage(any())).called(1);
    });
  });

  test('dispose closes interpreter', () {
    when(() => labeler.close()).thenAnswer((_) async {});

    detector.dispose();

    verify(() => labeler.close()).called(1);
  });
}

final img.Image _sampleImage = img.Image(width: 4, height: 4);
