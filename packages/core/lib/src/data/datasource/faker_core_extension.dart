import 'package:faker/faker.dart';

extension FakerCoreExtension on Faker {
  int randomMinutesCount(
    int numDays, {
    int max = 200,
    int min = 10,
    int spread = 50,
  }) {
    int sum = 0;
    for (var i = 0; i < numDays; ++i) {
      sum += randomGenerator.integer(
        max +   randomGenerator.integer(spread, min: spread * -1),
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
      sum += randomGenerator.integer(
        max + randomGenerator.integer(spread),
        min: 1,
      );
    }
    return sum;
  }
}