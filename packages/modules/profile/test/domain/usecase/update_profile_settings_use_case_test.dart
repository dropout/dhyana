import 'package:faker/faker.dart';
import 'package:profile/src/data/datasource/faker_profile_extension.dart';
import 'package:profile/src/domain/usecase/update_profile_settings_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../profile_mock_definitions.dart';

void main() {
  late MockProfileRepository profileRepository;
  late UpdateProfileSettingsUseCase useCase;
  late Faker fakeModelFactory;

  setUpAll(() {
    registerFallbackValue(Faker().createProfileEntity());
  });

  setUp(() {
    profileRepository = MockProfileRepository();
    fakeModelFactory = Faker();
    useCase = UpdateProfileSettingsUseCase(
      profileRepository: profileRepository,
    );
  });

  group('UpdateProfileSettingsUseCase.execute', () {
    test('updates profile settings and persists updated profile', () async {
      final profile = fakeModelFactory.createProfileEntity();
      final updatedFields = <String, dynamic>{
        'showStatsOnFinishScreen': false,
        'usePresenceFeature': false,
      };

      when(() => profileRepository.update(any())).thenAnswer((_) async => profile);

      final result = await useCase.execute(
        profileEntity: profile,
        updatedFields: updatedFields,
      );

      expect(result.settings.showStatsOnFinishScreen, isFalse);
      expect(result.settings.usePresenceFeature, isFalse);
      verify(() => profileRepository.update(result)).called(1);
    });
  });
}
