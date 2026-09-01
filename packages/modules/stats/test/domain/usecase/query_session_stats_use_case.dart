import 'package:stats/src/domain/entity/stats_bucket_entity.dart';
import 'package:stats/src/domain/enum/stats_entity_granularity.dart';
import 'package:stats/src/domain/usecase/query_session_stats_use_case.dart';
import 'package:stats/src/public/enum/stats_granularity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../stats_mock_definitions.dart';


void main() {
	late MockStatisticsRepository repository;
	late QuerySessionStatsUseCase useCase;

	setUp(() {
		repository = MockStatisticsRepository();
		useCase = QuerySessionStatsUseCase(repository: repository);
	});

	group('QueryStatsUseCase.execute', () {
		test('queries repository with mapped granularity and returns buckets', () async {
			const profileId = 'profile-1';
			final from = DateTime(2026, 1, 1);
			final to = DateTime(2026, 1, 31);
			final buckets = <StatsBucketEntity>[
				StatsBucketEntity.day(
					id: '2026-01-01',
					startDate: DateTime(2026, 1, 1),
					minutesCount: 20,
					sessionCount: 1,
				),
			];

			when(
				() => repository.queryBuckets(
					profileId,
					from: from,
					to: to,
					granularity: StatsEntityGranularity.days,
				),
			).thenAnswer((_) async => buckets);

			final result = await useCase.execute(
				profileId: profileId,
				from: from,
				to: to,
				granularity: StatsGranularity.days,
			);

			expect(result, equals(buckets));
			verify(
				() => repository.queryBuckets(
					profileId,
					from: from,
					to: to,
					granularity: StatsEntityGranularity.days,
				),
			).called(1);
		});

		test('forwards repository errors', () async {
			const profileId = 'profile-1';
			final from = DateTime(2026, 2, 1);
			final to = DateTime(2026, 2, 28);
			final error = Exception('query failed');

			when(
				() => repository.queryBuckets(
					profileId,
					from: from,
					to: to,
					granularity: StatsEntityGranularity.months,
				),
			).thenThrow(error);

			expect(
				() => useCase.execute(
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
