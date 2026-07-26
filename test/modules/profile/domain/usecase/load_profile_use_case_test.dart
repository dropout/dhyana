import 'package:dhyana/core/domain/model/fake/fake_model_factory.dart';
import 'package:dhyana/modules/profile/domain/usecase/load_profile_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../profile_mock_definitions.dart';


void main() {
  late MockProfileRepository profileRepository;
  late MockProfileStatsUpdater profileStatsUpdater;
  late LoadProfileUseCase useCase;
  late FakeModelFactory fakeModelFactory;

  setUpAll(() {
    registerFallbackValue(FakeModelFactory().createProfile());
  });

  setUp(() {
    profileRepository = MockProfileRepository();
    profileStatsUpdater = MockProfileStatsUpdater();
    fakeModelFactory = FakeModelFactory();
    useCase = LoadProfileUseCase(
      profileRepository: profileRepository,
      profileStatsUpdater: profileStatsUpdater,
    );
  });

  group('LoadProfileUseCase.execute', () {
    test(
      'returns loaded profile and does not persist when stats are unchanged',
      () async {
        final profile = fakeModelFactory.createProfile();

        when(
          () => profileRepository.read(profile.id),
        ).thenAnswer((_) async => profile);
        when(
          () => profileStatsUpdater.validateStatsReport(profile.statsReport),
        ).thenReturn(profile.statsReport);

        final result = await useCase.execute(profile.id);

        expect(result, equals(profile));
        verify(() => profileRepository.read(profile.id)).called(1);
        verify(
          () => profileStatsUpdater.validateStatsReport(profile.statsReport),
        ).called(1);
        verifyNever(() => profileRepository.update(any()));
      },
    );

    test(
      'returns updated profile and persists when stats are invalidated',
      () async {
        final profile = fakeModelFactory.createProfile();
        final updatedStatsReport = profile.statsReport.copyWith(
          completedDaysCount: profile.statsReport.completedDaysCount + 1,
        );

        when(
          () => profileRepository.read(profile.id),
        ).thenAnswer((_) async => profile);
        when(
          () => profileStatsUpdater.validateStatsReport(profile.statsReport),
        ).thenReturn(updatedStatsReport);
        when(() => profileRepository.update(any())).thenAnswer(
          (_) async => profile.copyWith(statsReport: updatedStatsReport),
        );

        final result = await useCase.execute(profile.id);

        expect(result.statsReport, equals(updatedStatsReport));
        verify(() => profileRepository.read(profile.id)).called(1);
        verify(
          () => profileStatsUpdater.validateStatsReport(profile.statsReport),
        ).called(1);
        verify(() => profileRepository.update(result)).called(1);
      },
    );
  });
}
