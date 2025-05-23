import 'package:dhyana/data_provider/all.dart';
import 'package:dhyana/util/all.dart';
import 'package:faker/faker.dart';
import 'package:dhyana/model/all.dart';

class FakeModelFactory {
  final Faker _faker = Faker();

  User createUser() {
    return User(
      uid: _faker.guid.guid(),
      email: _faker.internet.email(),
      metaData: UserMetaData(),
    );
  }

  Profile createProfile() {
    return Profile(
      id: _faker.guid.guid(),
      firstName: _faker.person.firstName(),
      lastName: _faker.person.lastName(),
      email: _faker.internet.email(),
      photoUrl: _faker.profilePhotoUrl(),
      photoBlurhash: _faker.profilePhotoBlurhash(),
      signupDate: DateTime.now(),
      statsReport: const ProfileStatisticsReport(),
      completed: _faker.randomGenerator.boolean(),
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
      minutesCount: _faker.randomGenerator.integer(100),
      sessionCount: _faker.randomGenerator.integer(10),
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
      minutesCount: 80 + _faker.randomGenerator.integer(100 * 7 - 80),
      sessionCount: 3 + _faker.randomGenerator.integer(4 * 7),
    );
  }

  Month createMonth({DateTime? startDate}) {
    startDate ??= DateTime.now();
    return Month(
      id: _faker.guid.guid(),
      startDate: startDate,
      minutesCount: 600 + _faker.randomGenerator.integer(1000 * 3 - 600),
      sessionCount: _faker.randomGenerator.integer(100) * 3,
    );
  }

  List<Month> createMonths(int count) {
    return List.generate(count, (_) => createMonth());
  }

  Year createYear({DateTime? startDate}) {
    startDate ??= DateTime.now();
    return Year(
      id: _faker.guid.guid(),
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
      id: _faker.guid.guid(),
      startTime: DateTime.now(),
      endTime: DateTime.now().add(const Duration(hours: 1)),
      duration: Duration(minutes: _faker.randomGenerator.integer(60)),
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
      sum += _faker.randomGenerator.integer(
        max + _faker.randomGenerator.integer(spread, min: spread * -1),
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
      sum += _faker.randomGenerator.integer(
        max + _faker.randomGenerator.integer(spread),
        min: 1
      );
    }
    return sum;
  }

}

