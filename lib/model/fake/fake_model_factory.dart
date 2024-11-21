import 'package:dhyana/util/faker.dart';
import 'package:faker/faker.dart';
import 'package:dhyana/model/all.dart';

class FakeModelFactory {
  final Faker _faker = Faker();

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
      id: '${startDate.year}${startDate.month}${startDate.day}',
      startDate: startDate,
      sessions: [],
      minutesCount: _faker.randomGenerator.integer(100),
      sessionCount: _faker.randomGenerator.integer(10),
    );
  }

  List<Day> createDays(int count) {
    return List.generate(count, (_) => createDay());
  }

  Week createWeek() {
    return Week(
      id: _faker.guid.guid(),
      startDate: DateTime.now(),
      minutesCount: _faker.randomGenerator.integer(100),
      sessionCount: _faker.randomGenerator.integer(10),
    );
  }

  Month createMonth() {
    return Month(
      id: _faker.guid.guid(),
      startDate: DateTime.now(),
      minutesCount: _faker.randomGenerator.integer(100),
      sessionCount: _faker.randomGenerator.integer(10),
    );
  }

  List<Month> createMonths(int count) {
    return List.generate(count, (_) => createMonth());
  }

  Year createYear() {
    return Year(
      id: _faker.guid.guid(),
      startDate: DateTime.now(),
      minutesCount: _faker.randomGenerator.integer(100),
      sessionCount: _faker.randomGenerator.integer(10),
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

}
