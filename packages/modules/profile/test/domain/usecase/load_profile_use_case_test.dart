import 'package:faker/faker.dart';
import 'package:profile/src/data/datasource/faker_profile_extension.dart';
import 'package:profile/src/domain/usecase/load_profile_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../profile_mock_definitions.dart';


void main() {
  late MockProfileRepository profileRepository;
  late MockProfileStatsUpdater profileStatsUpdater;  
  late Faker fakeModelFactory;
  late LoadProfileUseCase useCase;

  setUpAll(() {
    registerFallbackValue(Faker().createProfileEntity());
  });

  setUp(() {
    profileRepository = MockProfileRepository();
    profileStatsUpdater = MockProfileStatsUpdater();
    fakeModelFactory = Faker();
    useCase = LoadProfileUseCase(
      profileRepository: profileRepository,
      profileStatsUpdater: profileStatsUpdater,
    );
  });

  group('LoadProfileUseCase.execute', () {
    test(
      'returns loaded profile and does not persist when stats are unchanged',
      () async {
        final profile = fakeModelFactory.createProfileEntity();

        when(
          () => profileRepository.read(profile.id, preferCache: true),
        ).thenAnswer((_) async => profile);

        when(
          () => profileStatsUpdater.validateStatsReport(profile.statsReport),
        ).thenReturn(profile.statsReport);

        final result = await useCase.execute(profile.id, preferCache: true);

        expect(result, equals(profile));
        verify(() => profileRepository.read(profile.id, preferCache: true)).called(1);
        verify(
          () => profileStatsUpdater.validateStatsReport(profile.statsReport),
        ).called(1);
        verifyNever(() => profileRepository.update(any()));
      },
    );

    test(
      'returns updated profile and persists when stats are invalidated',
      () async {
        final profile = fakeModelFactory.createProfileEntity();
        final updatedStatsReport = profile.statsReport.copyWith(
          completedDaysCount: profile.statsReport.completedDaysCount + 1,
        );

        when(
          () => profileRepository.read(profile.id, preferCache: false),
        ).thenAnswer((_) async => profile);
        when(
          () => profileStatsUpdater.validateStatsReport(profile.statsReport),
        ).thenReturn(updatedStatsReport);
        when(() => profileRepository.update(any())).thenAnswer(
          (_) async => profile.copyWith(statsReport: updatedStatsReport),
        );

        final result = await useCase.execute(profile.id);

        expect(result.statsReport, equals(updatedStatsReport));
        verify(() => profileRepository.read(profile.id, preferCache: false)).called(1);
        verify(
          () => profileStatsUpdater.validateStatsReport(profile.statsReport),
        ).called(1);
        verify(() => profileRepository.update(result)).called(1);
      },
    );
  });
}
