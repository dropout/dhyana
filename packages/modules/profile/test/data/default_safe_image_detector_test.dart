import 'package:core/src/service/safe_image_detector.dart';
import 'package:core/src/infrastructure/platform/default_safe_image_detector.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image/image.dart' as img;
import 'package:mocktail/mocktail.dart';

import '../profile_mock_definitions.dart';

void main() {
  late MockInterpreter interpreter;
  late DefaultSafeImageDetector detector;

  setUp(() {
    interpreter = MockInterpreter();
    detector = DefaultSafeImageDetector.forTest(
      interpreter: interpreter,
      threshold: 0.7,
    );
  });

  group('DefaultSafeImageDetector.detectImageSafety', () {
    test('returns safe result when score is below threshold', () async {
      when(() => interpreter.run(any(), any())).thenAnswer((invocation) {
        final output = invocation.positionalArguments[1] as List<dynamic>;
        output[0] = [0.9, 0.2];
      });

      final result = await detector.detectImageSafety(_sampleImage);

      expect(result.isSafe, isTrue);
      expect(result.score, equals(0.2));
      verify(() => interpreter.run(any(), any())).called(1);
    });

    test('returns unsafe result when score is above threshold', () async {
      when(() => interpreter.run(any(), any())).thenAnswer((invocation) {
        final output = invocation.positionalArguments[1] as List<dynamic>;
        output[0] = [0.2, 0.9];
      });

      final result = await detector.detectImageSafety(_sampleImage);

      expect(result.isSafe, isFalse);
      expect(result.score, equals(0.9));
      verify(() => interpreter.run(any(), any())).called(1);
    });

    test('throws domain exception when output score is missing', () async {
      when(() => interpreter.run(any(), any())).thenAnswer((invocation) {
        final output = invocation.positionalArguments[1] as List<dynamic>;
        output[0] = [0.5];
      });

      expect(
        () => detector.detectImageSafety(_sampleImage),
        throwsA(isA<SafeImageDetectionException>()),
      );
      verify(() => interpreter.run(any(), any())).called(1);
    });
  });

  test('dispose closes interpreter', () {
    when(() => interpreter.close()).thenAnswer((_) {});

    detector.dispose();

    verify(() => interpreter.close()).called(1);
  });
}

final img.Image _sampleImage = img.Image(width: 4, height: 4);
