import 'package:dhyana/modules/stats/data/repository/bucket_filling_repository.dart';
import 'package:dhyana/modules/stats/domain/entity/stats_bucket_entity.dart';
import 'package:dhyana/modules/stats/domain/repository/statistics_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockStatisticsRepository extends Mock implements StatisticsRepository {}

void main() {
  group('BucketFillingRepository', () {
    late MockStatisticsRepository innerRepository;
    late BucketFillingRepository repository;

    setUp(() {
      innerRepository = MockStatisticsRepository();
      repository = BucketFillingRepository(statisticsRepository: innerRepository);
    });

    test('fills missing day buckets for the requested interval', () async {
      final from = DateTime(2024, 1, 1);
      final to = DateTime(2024, 1, 3);

      when(
        () => innerRepository.queryDays(
          any(),
          from: any(named: 'from'),
          to: any(named: 'to'),
        ),
      ).thenAnswer(
        (_) async => [
          DayStatsBucketEntity(
            id: '20240101',
            startDate: DateTime(2024, 1, 1),
            minutesCount: 10,
            sessionCount: 1,
          ),
        ],
      );

      final result = await repository.queryDays('profile-id', from: from, to: to);

      expect(result.map((bucket) => bucket.id), ['20240101', '20240102', '20240103']);
      expect(result[0].minutesCount, 10);
      expect(result[1].minutesCount, 0);
      expect(result[2].sessionCount, 0);
    });
  });
}
