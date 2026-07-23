import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dhyana/core/di/services.dart';
import 'package:dhyana/core/domain/model/fake/fake_model_factory.dart';
import 'package:dhyana/modules/account/domain/model/profile.dart';
import 'package:dhyana/service/safe_image_detector.dart';
import 'package:dhyana/core/presentation/widget/input/form_builder_profile_image_picker.dart';
import 'package:dhyana/core/presentation/widget/input/profile_image_picker/profile_image_selection_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../mock_definitions.dart';

void main() {
  final Profile profileWithoutPhoto = FakeModelFactory().createProfile().copyWith(
    photoUrl: null,
    photoBlurhash: null,
  );

  group('FormBuilderProfileImagePicker', () {
    late MockServices mockServices;
    late MockHapticsService mockHapticsService;
    late MockCrashlyticsService mockCrashlyticsService;
    late MockSafeImageDetectorFactory safeImageDetectorFactory;
    late MockSafeImageDetector safeImageDetector;

    setUp(() {
      mockServices = MockServices();
      mockHapticsService = MockHapticsService();
      mockCrashlyticsService = MockCrashlyticsService();
      safeImageDetectorFactory = MockSafeImageDetectorFactory();
      safeImageDetector = MockSafeImageDetector();

      when(() => mockServices.hapticsService).thenReturn(mockHapticsService);
      when(() => mockServices.crashlyticsService)
        .thenReturn(mockCrashlyticsService);
      when(() => mockServices.safeImageDetectorFactory)
        .thenReturn(safeImageDetectorFactory);
      when(() => mockHapticsService.tap()).thenReturn(null);
      when(() => safeImageDetectorFactory.create())
        .thenAnswer((_) async => safeImageDetector);
    });

    testWidgets('does not use the detector while building', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        _buildTestApp(
          mockServices: mockServices,
          child: FormBuilderProfileImagePicker(
            name: 'imageData',
            label: 'Profile Image',
            profile: profileWithoutPhoto,
            pickImage: () async => null,
          ),
        ),
      );

      verifyNever(() => safeImageDetector.detectImageSafety(any()));
    });

    test('reports decode failures before using the detector', () async {
      final safeImageDetector = MockSafeImageDetector();
      final controller = ProfileImageSelectionController(
        pickImage: () => _createTempXFile(
          Uint8List.fromList([1, 2, 3]),
          'invalid_profile_image.bin',
        ),
        safeImageDetectorService: safeImageDetector,
      );

      final result = await controller.selectProfileImage();

      expect(result.error, ProfileImagePickerError.imageLoadingFailed);
      expect(result.imageData, isNull);
      // expect(safeImageDetector.detectCalls, 0);
      verifyNever(() => safeImageDetector.detectImageSafety(any()));
    });

    test('returns encoded image data after a safe pick', () async {
      when(() => safeImageDetector.detectImageSafety(any()))
        .thenAnswer((_) async => ImageSafetyDetectionResult(true, 0.1));
      
      final controller = ProfileImageSelectionController(
        pickImage: () => _createTempXFile(
          _validImageBytes,
          'valid_profile_image.png',
        ),
        safeImageDetectorService: safeImageDetector,
      );

      final result = await controller.selectProfileImage();

      verify(() => safeImageDetector.detectImageSafety(any())).called(1);
      expect(result.error, isNull);
      expect(result.isCancelled, isFalse);
      expect(result.imageData, isA<Uint8List>());
      expect(result.imageData, isNotEmpty);
    });
  });
}

Widget _buildTestApp({
  required MockServices mockServices,
  required Widget child,
}) {
  return MultiProvider(
    providers: [
      Provider<Services>(create: (_) => mockServices),
    ],
    child: MaterialApp(
      home: Scaffold(
        body: Material(child: child),
      ),
    ),
  );
}


Future<XFile> _createTempXFile(Uint8List bytes, String fileName) async {
  final file = File('${Directory.systemTemp.path}/$fileName');
  await file.writeAsBytes(bytes, flush: true);
  return XFile(file.path);
}

final Uint8List _validImageBytes = base64Decode(
  'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAABGdBTUEAALGPC/xhBQAAADhlWElmTU0AKgAAAAgAAYdpAAQAAAABAAAAGgAAAAAAAqACAAQAAAABAAAAAaADAAQAAAABAAAAAQAAAADa6r/EAAAAC0lEQVQIHWNgAAIAAAUAAY27m/MAAAAASUVORK5CYII=',
);