import 'package:dhyana/enum/session_type.dart';
import 'package:dhyana/util/faker.dart';
import 'package:dhyana/util/date_time_utils.dart';
import 'package:dhyana/model/all.dart';
import 'package:faker/faker.dart';
import 'package:dhyana/data_provider/auth/model/user.dart';
import 'package:dhyana/data_provider/auth/model/user_meta_data.dart';

class FakeModelFactory {
  final Faker faker = Faker();

  User createUser() {
    return User(
      uid: faker.guid.guid(),
      email: faker.internet.email(),
      metaData: UserMetaData(),
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
      statsReport: const ProfileStatisticsReport(),
      completed: faker.randomGenerator.boolean(),
    );
  }

  List<Profile> createProfiles(int count) {
    return List.generate(count, (_) => createProfile());
  }

  Day createDay({DateTime? startDate}) {
    startDate ??= DateTime.now();
    return Day(
      id: startDate.toDayId(),
      startDate: startDate,
      sessions: [],
      minutesCount: faker.randomGenerator.integer(100),
      sessionCount: faker.randomGenerator.integer(10),
    );
  }

  List<Day> createDays(int count) {
    return List.generate(count, (_) => createDay());
  }

  Week createWeek({DateTime? startDate}) {
    startDate ??= DateTime.now();
    return Week(
      id: startDate.toWeekId(),
      startDate: startDate,
      minutesCount: 80 + faker.randomGenerator.integer(100 * 7 - 80),
      sessionCount: 3 + faker.randomGenerator.integer(4 * 7),
    );
  }

  List<Week> createWeeks(int count) {
    return List.generate(count, (_) => createWeek());
  }

  Month createMonth({DateTime? startDate}) {
    startDate ??= DateTime.now();
    return Month(
      id: faker.guid.guid(),
      startDate: startDate,
      minutesCount: 600 + faker.randomGenerator.integer(1000 * 3 - 600),
      sessionCount: faker.randomGenerator.integer(100) * 3,
    );
  }

  List<Month> createMonths(int count) {
    return List.generate(count, (_) => createMonth());
  }

  Year createYear({DateTime? startDate}) {
    startDate ??= DateTime.now();
    return Year(
      id: faker.guid.guid(),
      startDate: startDate,
      minutesCount: randomMinutesCount(365),
      sessionCount: randomSessionCount(365),
    );
  }

  List<Year> createYears(int count) {
    return List.generate(count, (_) => createYear());
  }

  Session createSession() {
    return Session(
      id: faker.guid.guid(),
      type: SessionType.timer,
      startTime: DateTime.now(),
      endTime: DateTime.now().add(const Duration(hours: 1)),
      duration: Duration(minutes: faker.randomGenerator.integer(60)),
      timerSettings: const TimerSettings(),
    );
  }

  List<Session> createSessions(int count) {
    return List.generate(count, (_) => createSession());
  }

  int randomMinutesCount(int numDays, {
    int max = 200,
    int min = 10,
    int spread = 50,
  }) {
    int sum = 0;
    for (var i = 0; i < numDays; ++i) {
      sum += faker.randomGenerator.integer(
        max + faker.randomGenerator.integer(spread, min: spread * -1),
        min: 10
      );
    }
    return sum;
  }

  int randomSessionCount(int numDays, {
    int max = 10,
    int min = 1,
    int spread = 5,
  }) {
    int sum = 0;
    for (var i = 0; i < numDays; ++i) {
      sum += faker.randomGenerator.integer(
        max + faker.randomGenerator.integer(spread),
        min: 1
      );
    }
    return sum;
  }

}
