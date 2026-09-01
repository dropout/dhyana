
import 'package:faker/faker.dart';
import 'package:profile/src/data/datasource/faker_profile_extension.dart';
import 'package:profile/src/domain/entity/profile_session_entity.dart';
import 'package:profile/src/domain/usecase/update_profile_stats_with_session_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../profile_mock_definitions.dart';

void main() {
	late MockProfileRepository profileRepository;
	late MockProfileStatsUpdater profileStatsReportUpdaterService;
	late Faker fakeModelFactory;
	late UpdateProfileStatsWithSessionUseCase useCase;

	setUp(() {
		profileRepository = MockProfileRepository();
		profileStatsReportUpdaterService = MockProfileStatsUpdater();
		fakeModelFactory = Faker();
		useCase = UpdateProfileStatsWithSessionUseCase(
			profileRepository: profileRepository,
			profileStatsReportUpdaterService: profileStatsReportUpdaterService,
		);
	});

	group('UpdateProfileStatsWithSessionUseCase.execute', () {
		test('returns original and updated profile from repository + updater service', () async {
			const profileId = 'profile-1';
			final originalProfile = fakeModelFactory.createProfileEntity().copyWith(id: profileId);
			final session = ProfileSessionEntity(
				id: 'session-1',
				type: ProfileSessionEntityType.sitting,
				startTime: DateTime(2026, 1, 10, 7),
				endTime: DateTime(2026, 1, 10, 7, 20),
				duration: const Duration(minutes: 20),
			);
			final updatedProfile = originalProfile.copyWith(
				statsReport: originalProfile.statsReport.copyWith(
					completedSessionsCount: originalProfile.statsReport.completedSessionsCount + 1,
				),
			);

			when(() => profileRepository.read(profileId, preferCache: true))
					.thenAnswer((_) async => originalProfile);
			when(
				() => profileStatsReportUpdaterService.updateProfileStatsWithSession(
					originalProfile,
					session,
				),
			).thenReturn(updatedProfile);

			final result = await useCase.execute(profileId, session);

			expect(result.originalProfile, equals(originalProfile));
			expect(result.updatedProfile, equals(updatedProfile));
			verify(() => profileRepository.read(profileId, preferCache: true)).called(1);
			verify(
				() => profileStatsReportUpdaterService.updateProfileStatsWithSession(
					originalProfile,
					session,
				),
			).called(1);
			verifyNoMoreInteractions(profileRepository);
		});

		test('forwards repository read errors and skips updater service', () async {
			const profileId = 'profile-2';
			final session = ProfileSessionEntity(
				id: 'session-2',
				type: ProfileSessionEntityType.chanting,
				startTime: DateTime(2026, 1, 11, 8),
				endTime: DateTime(2026, 1, 11, 8, 15),
				duration: const Duration(minutes: 15),
			);
			final error = Exception('read failed');

			when(() => profileRepository.read(profileId, preferCache: true))
					.thenThrow(error);

			expect(
				() => useCase.execute(profileId, session),
				throwsA(same(error)),
			);
			verifyZeroInteractions(profileStatsReportUpdaterService);
		});
	});
}
