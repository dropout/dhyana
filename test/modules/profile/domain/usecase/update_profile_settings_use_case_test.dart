import 'package:dhyana/core/util/fake_model_factory.dart';
import 'package:dhyana/modules/profile/domain/usecase/update_profile_settings_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../profile_mock_definitions.dart';

void main() {
  late MockProfileRepository profileRepository;
  late UpdateProfileSettingsUseCase useCase;
  late FakeModelFactory fakeModelFactory;

  setUpAll(() {
    registerFallbackValue(FakeModelFactory().createProfile());
  });

  setUp(() {
    profileRepository = MockProfileRepository();
    fakeModelFactory = FakeModelFactory();
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
