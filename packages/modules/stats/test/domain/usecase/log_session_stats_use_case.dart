import 'package:profile/profile.dart';
import 'package:stats/src/domain/entity/stats_session_entity.dart';
import 'package:stats/src/domain/usecase/log_session_stats_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../stats_mock_definitions.dart';



void main() {
	late MockStatisticsRepository statsRepository;
	late MockProfilePublicApi profilePublicApi;
	late LogSessionStatsUseCase useCase;

	setUpAll(() {
		registerFallbackValue(
			StatsSessionEntity(
				id: 'fallback-session',
				type: .sitting,
				startTime: DateTime(2026, 1, 1, 0, 0),
				endTime: DateTime(2026, 1, 1, 0, 1),
				duration: const Duration(minutes: 1),
			),
		);
	});

	setUp(() {
		statsRepository = MockStatisticsRepository();
		profilePublicApi = MockProfilePublicApi();
		useCase = LogSessionStatsUseCase(
			statsRepository: statsRepository,
			profilePublicApi: profilePublicApi,
		);
	});

	group('LogSessionStatsUseCase.execute', () {
		test('loads profile from cache and logs with profile consecutive days', () async {
			const profileId = 'profile-1';
			final session = StatsSessionEntity(
				id: 'session-1',
				type: .sitting,
				startTime: DateTime(2026, 1, 10, 7),
				endTime: DateTime(2026, 1, 10, 7, 20),
				duration: const Duration(minutes: 20),
			);
			final profile = Profile(
				id: profileId,
				firstName: 'Ada',
				lastName: 'Lovelace',
				email: 'ada@dhyana.app',
				photoUrl: null,
				photoBlurhash: null,
				signupDate: DateTime(2026, 1, 1),
				statsReport: const ProfileStatsReport(
					consecutiveDays: ConsecutiveDays(current: 5, longest: 7),
				),
				completed: true,
			);

			when(
				() => profilePublicApi.getProfile(profileId, preferCache: true),
			).thenAnswer((_) async => profile);
			when(
				() => statsRepository.logSessionStats(profileId, session, 5),
			).thenAnswer((_) async {});

			await useCase.execute(profileId, session);

			verify(() => profilePublicApi.getProfile(profileId, preferCache: true)).called(1);
			verify(() => statsRepository.logSessionStats(profileId, session, 5)).called(1);
		});

		test('forwards profile loading errors and skips logging', () async {
			const profileId = 'profile-1';
			final session = StatsSessionEntity(
				id: 'session-2',
				type: .chanting,
				startTime: DateTime(2026, 1, 11, 8),
				endTime: DateTime(2026, 1, 11, 8, 15),
				duration: const Duration(minutes: 15),
			);
			final error = Exception('profile missing');

			when(
				() => profilePublicApi.getProfile(profileId, preferCache: true),
			).thenThrow(error);

			expect(
				() => useCase.execute(profileId, session),
				throwsA(same(error)),
			);
			verifyNever(() => statsRepository.logSessionStats(any(), any(), any()));
		});
	});
}
