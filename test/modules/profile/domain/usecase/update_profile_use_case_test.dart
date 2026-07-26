import 'dart:typed_data';

import 'package:dhyana/core/domain/model/fake/fake_model_factory.dart';
import 'package:dhyana/modules/profile/domain/usecase/update_profile_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image/image.dart' as img;
import 'package:mocktail/mocktail.dart';

import '../../../../mock_definitions.dart';

void main() {
  late MockProfileRepository profileRepository;
  late MockStorageRepository storageRepository;
  late UpdateProfileUseCase useCase;
  late FakeModelFactory fakeModelFactory;

  setUpAll(() {
    registerFallbackValue(FakeModelFactory().createProfile());
    registerFallbackValue(Uint8List(0));
  });

  setUp(() {
    profileRepository = MockProfileRepository();
    storageRepository = MockStorageRepository();
    fakeModelFactory = FakeModelFactory();
    useCase = UpdateProfileUseCase(
      profileRepository: profileRepository,
      storageRepository: storageRepository,
    );
  });

  group('UpdateProfileUseCase.execute', () {
    test('updates profile data only when image is not provided', () async {
      final profile = fakeModelFactory.createProfile();
      final updatedFields = <String, dynamic>{
        'firstName': 'John',
        'lastName': 'Doe',
      };

      when(() => profileRepository.update(any())).thenAnswer((_) async => profile);

      final result = await useCase.execute(
        profile: profile,
        updatedFields: updatedFields,
        completeProfile: true,
      );

      final expectedProfile = profile.copyWith(
        firstName: 'John',
        lastName: 'Doe',
        completed: true,
        location: null,
      );

      expect(result, equals(expectedProfile));
      verify(() => profileRepository.update(expectedProfile)).called(1);
      verifyNever(() => storageRepository.uploadProfileImage(any(), any()));
    });

    test('uploads image and updates profile with blurhash when image is provided',
        () async {
      final profile = fakeModelFactory.createProfile();
      final imageData = _createValidImageBytes();
      final updatedFields = <String, dynamic>{
        'imageData': imageData,
      };

      when(
        () => storageRepository.uploadProfileImage(profile.id, imageData),
      ).thenAnswer((_) async {});
      when(() => profileRepository.update(any())).thenAnswer((_) async => profile);

      final result = await useCase.execute(
        profile: profile,
        updatedFields: updatedFields,
      );

      expect(result.photoBlurhash, isNotNull);
      expect(result.photoBlurhash, isNotEmpty);
      verify(() => storageRepository.uploadProfileImage(profile.id, imageData))
          .called(1);
      verify(() => profileRepository.update(result)).called(1);
    });
  });
}

Uint8List _createValidImageBytes() {
  final image = img.Image(width: 8, height: 8);
  img.fill(image, color: img.ColorRgb8(120, 80, 200));
  return Uint8List.fromList(img.encodePng(image));
}
