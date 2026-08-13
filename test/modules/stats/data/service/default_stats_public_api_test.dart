import 'package:dhyana/core/domain/enum/home_screen_view_state.dart';
import 'package:dhyana/modules/profile/public/model/consecutive_days.dart';
import 'package:dhyana/modules/profile/public/model/profile.dart';
import 'package:dhyana/modules/profile/public/model/profile_stats_report.dart';
import 'package:dhyana/modules/stats/data/service/default_stats_public_api.dart';
import 'package:dhyana/modules/stats/domain/entity/insights_session_entity.dart';
import 'package:dhyana/modules/stats/domain/entity/stats_bucket_entity.dart';
import 'package:dhyana/modules/stats/domain/enum/stats_entity_granularity.dart';
import 'package:dhyana/modules/stats/public/enum/stats_granularity.dart';
import 'package:dhyana/modules/stats/public/model/stats_bucket.dart';
import 'package:dhyana/modules/stats/public/model/stats_session.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mock_definitions.dart';

void main() {
	late MockStatisticsRepository statisticsRepository;
	late MockProfilePublicApi profilePublicApi;
	late DefaultStatsPublicApi api;

	setUpAll(() {
		registerFallbackValue(
			StatsSessionEntity(
				id: 'fallback-session',
				type: HomeScreenViewState.sitting,
				startTime: DateTime(2026, 1, 1, 0, 0),
				endTime: DateTime(2026, 1, 1, 0, 1),
				duration: const Duration(minutes: 1),
			),
		);
	});

	setUp(() {
		statisticsRepository = MockStatisticsRepository();
		profilePublicApi = MockProfilePublicApi();
		api = DefaultStatsPublicApi(
			statisticsRepository: statisticsRepository,
			profilePublicApi: profilePublicApi,
		);
	});

	group('DefaultStatsPublicApi.logSessionStatistics', () {
		test('loads profile and logs mapped session with consecutive day count', () async {
			const profileId = 'profile-1';
			final session = StatsSession(
				id: 'session-1',
				type: HomeScreenViewState.sitting,
				startTime: DateTime(2026, 1, 10, 7),
				endTime: DateTime(2026, 1, 10, 7, 20),
				duration: const Duration(minutes: 20),
			);
			final expectedEntity = StatsSessionEntity(
				id: session.id,
				type: session.type,
				startTime: session.startTime,
				endTime: session.endTime,
				duration: session.duration,
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
					consecutiveDays: ConsecutiveDays(current: 6, longest: 9),
				),
				completed: true,
			);

			when(
				() => profilePublicApi.getProfile(profileId, preferCache: true),
			).thenAnswer((_) async => profile);
			when(
				() => statisticsRepository.logSessionStats(profileId, expectedEntity, 6),
			).thenAnswer((_) async {});

			await api.logSessionStatistics(profileId, session);

			verify(() => profilePublicApi.getProfile(profileId, preferCache: true)).called(1);
			verify(
				() => statisticsRepository.logSessionStats(profileId, expectedEntity, 6),
			).called(1);
		});

		test('forwards profile api errors and skips repository logging', () async {
			const profileId = 'profile-1';
			final session = StatsSession(
				id: 'session-2',
				type: HomeScreenViewState.chanting,
				startTime: DateTime(2026, 1, 11, 8),
				endTime: DateTime(2026, 1, 11, 8, 15),
				duration: const Duration(minutes: 15),
			);
			final error = Exception('profile read failed');

			when(
				() => profilePublicApi.getProfile(profileId, preferCache: true),
			).thenThrow(error);

			expect(
				() => api.logSessionStatistics(profileId, session),
				throwsA(same(error)),
			);
			verifyNever(() => statisticsRepository.logSessionStats(any(), any(), any()));
		});
	});

	group('DefaultStatsPublicApi.queryBuckets', () {
		test('queries repository with mapped granularity and maps result to api buckets', () async {
			const profileId = 'profile-2';
			final from = DateTime(2026, 2, 1);
			final to = DateTime(2026, 2, 28);
			final entities = <StatsBucketEntity>[
				StatsBucketEntity.day(
					id: '2026-02-01',
					startDate: DateTime(2026, 2, 1),
					minutesCount: 30,
					sessionCount: 2,
				),
			];

			when(
				() => statisticsRepository.queryBuckets(
					profileId,
					from: from,
					to: to,
					granularity: StatsEntityGranularity.days,
				),
			).thenAnswer((_) async => entities);

			final result = await api.queryBuckets(
				profileId: profileId,
				from: from,
				to: to,
				granularity: StatsGranularity.days,
			);

			expect(
				result,
				equals(
					<StatsBucket>[
						StatsBucket.day(
							id: '2026-02-01',
							startDate: DateTime(2026, 2, 1),
							minutesCount: 30,
							sessionCount: 2,
						),
					],
				),
			);
			verify(
				() => statisticsRepository.queryBuckets(
					profileId,
					from: from,
					to: to,
					granularity: StatsEntityGranularity.days,
				),
			).called(1);
		});

		test('forwards repository errors', () async {
			const profileId = 'profile-2';
			final from = DateTime(2026, 3, 1);
			final to = DateTime(2026, 3, 31);
			final error = Exception('query failed');

			when(
				() => statisticsRepository.queryBuckets(
					profileId,
					from: from,
					to: to,
					granularity: StatsEntityGranularity.months,
				),
			).thenThrow(error);

			expect(
				() => api.queryBuckets(
					profileId: profileId,
					from: from,
					to: to,
					granularity: StatsGranularity.months,
				),
				throwsA(same(error)),
			);
		});
	});
}
