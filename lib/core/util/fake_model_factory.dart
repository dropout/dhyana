import 'package:dhyana/core/domain/enum/home_screen_view_state.dart';
import 'package:dhyana/modules/auth/domain/entity/user_entity.dart';
import 'package:dhyana/modules/auth/domain/entity/user_meta_data_entity.dart';
import 'package:dhyana/modules/insights/domain/entity/day_details_entity.dart';
import 'package:dhyana/modules/insights/domain/entity/insights_session_entity.dart';
import 'package:dhyana/modules/insights/domain/entity/stats_bucket_entity.dart';
import 'package:dhyana/modules/practice/session/domain/entity/session_entity.dart';
import 'package:dhyana/modules/profile/domain/entity/profile_stats_report_entity.dart';
import 'package:dhyana/modules/profile/profile_module.dart';
import 'package:dhyana/core/util/faker.dart';
import 'package:dhyana/core/util/date_time_utils.dart';
import 'package:dhyana/modules/profile/domain/entity/profile_entity.dart';
import 'package:faker/faker.dart';

class FakeModelFactory {
  final Faker faker = Faker();

  UserEntity createUser() {
    return UserEntity(
      uid: faker.guid.guid(),
      email: faker.internet.email(),
      metaData: UserMetaDataEntity(),
    );
  }

  Profile createProfile() {
    return Profile(
      id: faker.guid.guid(),
      firstName: faker.person.firstName(),
      lastName: faker.person.lastName(),
      email: faker.internet.email(),
      photoUrl: faker.profilePhotoUrl(),
      photoBlurhash: faker.profilePhotoBlurhash(),
      signupDate: DateTime.now(),
      statsReport: const ProfileStatsReport(),
      completed: faker.randomGenerator.boolean(),
    );
  }

  ProfileEntity createProfileEntity() {
    return ProfileEntity(
      id: faker.guid.guid(),
      firstName: faker.person.firstName(),
      lastName: faker.person.lastName(),
      email: faker.internet.email(),
      photoUrl: faker.profilePhotoUrl(),
      photoBlurhash: faker.profilePhotoBlurhash(),
      signupDate: DateTime.now(),
      statsReport: const ProfileStatsReportEntity(),
      completed: faker.randomGenerator.boolean(),
    );
  }

  List<Profile> createProfiles(int count) {
    return List.generate(count, (_) => createProfile());
  }

  DayStatsBucketEntity createDay({DateTime? startDate}) {
    startDate ??= DateTime.now();
    return DayStatsBucketEntity(
      id: startDate.toDayId(),
      startDate: startDate,
      minutesCount: faker.randomGenerator.integer(100),
      sessionCount: faker.randomGenerator.integer(10),
    );
  }

  List<DayStatsBucketEntity> createDays(int count) {
    return List.generate(count, (_) => createDay());
  }

  DayDetailsEntity createDayDetails({DateTime? startDate}) {
    startDate ??= DateTime.now();
    return DayDetailsEntity(
      id: startDate.toDayId(),
      startDate: startDate,
      sessions: createSessions(faker.randomGenerator.integer(5)).map((s) => InsightsSessionEntity(
        id: s.id,
        type: s.type,
        startTime: s.startTime,
        endTime: s.endTime,
        duration: s.duration,
      )).toList(),
      consecutiveDaysCount: faker.randomGenerator.integer(30),
    );
  }

  List<DayDetailsEntity> createDayDetailsList(int count) {
    return List.generate(count, (_) => createDayDetails());
  }

  WeekStatsBucketEntity createWeek({DateTime? startDate}) {
    startDate ??= DateTime.now();
    return WeekStatsBucketEntity(
      id: startDate.toWeekId(),
      startDate: startDate,
      minutesCount: 80 + faker.randomGenerator.integer(100 * 7 - 80),
      sessionCount: 3 + faker.randomGenerator.integer(4 * 7),
    );
  }

  List<WeekStatsBucketEntity> createWeeks(int count) {
    return List.generate(count, (_) => createWeek());
  }

  MonthStatsBucketEntity createMonth({DateTime? startDate}) {
    startDate ??= DateTime.now();
    return MonthStatsBucketEntity(
      id: faker.guid.guid(),
      startDate: startDate,
      minutesCount: 600 + faker.randomGenerator.integer(1000 * 3 - 600),
      sessionCount: faker.randomGenerator.integer(100) * 3,
    );
  }

  List<MonthStatsBucketEntity> createMonths(int count) {
    return List.generate(count, (_) => createMonth());
  }

  YearStatsBucketEntity createYear({DateTime? startDate}) {
    startDate ??= DateTime.now();
    return YearStatsBucketEntity(
      id: faker.guid.guid(),
      startDate: startDate,
      minutesCount: randomMinutesCount(365),
      sessionCount: randomSessionCount(365),
    );
  }

  List<YearStatsBucketEntity> createYears(int count) {
    return List.generate(count, (_) => createYear());
  }

  SessionEntity createSession() {
    return SessionEntity(
      id: faker.guid.guid(),
      type: HomeScreenViewState.sitting,
      startTime: DateTime.now(),
      endTime: DateTime.now().add(const Duration(hours: 1)),
      duration: Duration(minutes: faker.randomGenerator.integer(60)),
    );
  }

  List<SessionEntity> createSessions(int count) {
    return List.generate(count, (_) => createSession());
  }

  int randomMinutesCount(
    int numDays, {
    int max = 200,
    int min = 10,
    int spread = 50,
  }) {
    int sum = 0;
    for (var i = 0; i < numDays; ++i) {
      sum += faker.randomGenerator.integer(
        max + faker.randomGenerator.integer(spread, min: spread * -1),
        min: 10,
      );
    }
    return sum;
  }

  int randomSessionCount(
    int numDays, {
    int max = 10,
    int min = 1,
    int spread = 5,
  }) {
    int sum = 0;
    for (var i = 0; i < numDays; ++i) {
      sum += faker.randomGenerator.integer(
        max + faker.randomGenerator.integer(spread),
        min: 1,
      );
    }
    return sum;
  }
}
