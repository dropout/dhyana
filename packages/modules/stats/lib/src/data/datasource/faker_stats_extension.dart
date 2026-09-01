import 'package:core/core.dart';
import 'package:faker/faker.dart';
import 'package:profile/profile.dart';
import 'package:stats/src/domain/entity/day_details_entity.dart';
import 'package:stats/src/domain/entity/stats_session_entity.dart';
import 'package:stats/src/domain/entity/stats_bucket_entity.dart';

extension FakerCoreExtension on Faker {
  DayStatsBucketEntity createDayStatsBucketEntity({DateTime? startDate}) {
    startDate ??= DateTime.now();
    return DayStatsBucketEntity(
      id: startDate.toDayId(),
      startDate: startDate,
      minutesCount: randomGenerator.integer(100),
      sessionCount: randomGenerator.integer(10),
    );
  }

  List<DayStatsBucketEntity> createDayStatsBucketEntityList(int count) {
    return List.generate(count, (_) => createDayStatsBucketEntity());
  }

  DayDetailsEntity createDayDetailsEntity({DateTime? startDate}) {
    startDate ??= DateTime.now();
    return DayDetailsEntity(
      id: startDate.toDayId(),
      startDate: startDate,
      sessions: createSessionEntityList(randomGenerator.integer(5))
          .map(
            (s) => StatsSessionEntity(
              id: s.id,
              type: s.type,
              startTime: s.startTime,
              endTime: s.endTime,
              duration: s.duration,
            ),
          )
          .toList(),
      consecutiveDaysCount: randomGenerator.integer(30),
    );
  }

  List<DayDetailsEntity> createDayDetailsEntityList(int count) {
    return List.generate(count, (_) => createDayDetailsEntity());
  }

  WeekStatsBucketEntity createWeekStatsBucketEntity({DateTime? startDate}) {
    startDate ??= DateTime.now();
    return WeekStatsBucketEntity(
      id: startDate.toWeekId(),
      startDate: startDate,
      minutesCount: 80 + randomGenerator.integer(100 * 7 - 80),
      sessionCount: 3 + randomGenerator.integer(4 * 7),
    );
  }

  List<WeekStatsBucketEntity> createWeekStatsBucketEntityList(int count) {
    return List.generate(count, (_) => createWeekStatsBucketEntity());
  }

  MonthStatsBucketEntity createMonthStatsBucketEntity({DateTime? startDate}) {
    startDate ??= DateTime.now();
    return MonthStatsBucketEntity(
      id: guid.guid(),
      startDate: startDate,
      minutesCount: 600 + randomGenerator.integer(1000 * 3 - 600),
      sessionCount: randomGenerator.integer(100) * 3,
    );
  }

  List<MonthStatsBucketEntity> createMonthStatsBucketEntityList(int count) {
    return List.generate(count, (_) => createMonthStatsBucketEntity());
  }

  YearStatsBucketEntity createYearStatsBucketEntity({DateTime? startDate}) {
    startDate ??= DateTime.now();
    return YearStatsBucketEntity(
      id: faker.guid.guid(),
      startDate: startDate,
      minutesCount: randomMinutesCount(365),
      sessionCount: randomSessionCount(365),
    );
  }

  List<YearStatsBucketEntity> createYearStatsBucketEntityList(int count) {
    return List.generate(count, (_) => createYearStatsBucketEntity());
  }

  StatsSessionEntity createSessionEntity({DateTime? startTime}) {
    startTime ??= DateTime.now();
    final duration = Duration(minutes: randomGenerator.integer(60));
    return StatsSessionEntity(
      id: guid.guid(),
      type:
          StatsSessionEntityType.values[randomGenerator.integer(
            StatsSessionEntityType.values.length,
          )],
      startTime: startTime,
      endTime: startTime.add(duration),
      duration: duration,
    );
  }

  List<StatsSessionEntity> createSessionEntityList(int count) {
    return List.generate(count, (_) => createSessionEntity());
  }

  Profile createProfile({String? id}) {
    return Profile(
      id: id ?? guid.guid(),
      firstName: faker.person.firstName(),
      lastName: faker.person.lastName(),
      email: faker.internet.email(),
      photoUrl: null,
      photoBlurhash: null,
      signupDate: DateTime.now().subtract(Duration(days: randomGenerator.integer(365))),
      statsReport: ProfileStatsReport(
        completedDaysCount: randomGenerator.integer(365),
        consecutiveDays: ConsecutiveDays(
          current: randomGenerator.integer(30),
          longest: randomGenerator.integer(100),
          startedAt: DateTime.now().subtract(Duration(days: randomGenerator.integer(30))),
          lastChecked: DateTime.now().subtract(Duration(hours: randomGenerator.integer(24))),
        ),
      ),
      completed: true,
    );
  }
}
