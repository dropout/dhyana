import 'dart:math';

import 'package:dhyana/model/presence.dart';
import 'package:dhyana/model/public_profile.dart';
import 'package:dhyana/repository/all.dart';
import 'package:dhyana/util/all.dart';
import 'package:faker/faker.dart';

final List<String> maleFirstnames = ['James', 'John', 'Robert', 'Michael', 'William', 'David', 'Richard', 'Joseph', 'Thomas', 'Charles', 'Christopher', 'Daniel', 'Matthew', 'Anthony', 'Donald', 'Mark', 'Paul', 'Steven', 'Andrew', 'Kenneth'];
final List<String> femaleFirstnames = ['Olivia', 'Ava', 'Sophia', 'Isabella', 'Mia', 'Amelia', 'Harper', 'Evelyn', 'Abigail', 'Ella', 'Avery', 'Scarlett', 'Grace', 'Madison', 'Lily', 'Chloe', 'Aria', 'Zoey', 'Charlotte'];
final List<String> lastNames = ['Smith', 'Johnson', 'Williams', 'Brown', 'Jones', 'Garcia', 'Martinez', 'Rodriguez', 'Wilson', 'Anderson', 'Thomas', 'Taylor', 'Moore', 'Jackson', 'Martin', 'Lee', 'Perez', 'Thompson', 'White', 'Harris'];

String randomName(List<String> names) {
  return names[Random().nextInt(names.length)];
}

enum _Gender {
  male,
  female,
}

PublicProfile _randomPublicProfile(_Gender gender) {
  final Faker faker = Faker();
  int randomInt = Random().nextInt(20);
  switch (gender) {
    case _Gender.male:
      return PublicProfile(
        id: faker.guid.guid(),
        firstName: randomName(maleFirstnames),
        lastName: randomName(lastNames),
        photoUrl: 'https://randomuser.me/api/portraits/thumb/men/$randomInt.jpg',
        photoBlurhash: DefaultProfileData.photoBlurhash,
      );
    case _Gender.female:
      return PublicProfile(
        id: faker.guid.guid(),
        firstName: randomName(femaleFirstnames),
        lastName: randomName(lastNames),
        photoUrl: 'https://randomuser.me/api/portraits/thumb/women/$randomInt.jpg',
        photoBlurhash: DefaultProfileData.photoBlurhash,
      );
  }
}


class StubbedPresenceRepository implements PresenceRepository {

  final Faker _faker = Faker();

  @override
  Future<List<Presence>> getPresence(String? ownProfileId) async {
    await Future.delayed(Duration(seconds: 1));
    return Future.sync(() {
      return List<Presence>.generate(20, (index) {
        _Gender randomGender = Random().nextInt(2) % 2 == 0 ? _Gender.male : _Gender.female;
        return Presence(
          id: _faker.guid.guid(),
          profile: _randomPublicProfile(randomGender),
          startedAt: DateTime.now().subtract(Duration(minutes: 1 + index * 3)),
        );
      });
    });
  }

  @override
  Future<void> showPresence(Presence presence) {
    return Future.value();
  }

}
