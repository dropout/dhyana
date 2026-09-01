import 'dart:math';

import 'package:social/src/domain/entity/presence_entity.dart';
import 'package:social/src/domain/entity/presence_query_options_entity.dart';
import 'package:social/src/domain/entity/social_profile_entity.dart';
import 'package:social/src/domain/repository/presence_repository.dart';
import 'package:core/core.dart';
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

SocialProfileEntity _randomPublicProfile(_Gender gender) {
  final Faker faker = Faker();
  int randomInt = Random().nextInt(20);
  switch (gender) {
    case _Gender.male:
      return SocialProfileEntity(
        id: faker.guid.guid(),
        firstName: randomName(maleFirstnames),
        lastName: randomName(lastNames),
        photoUrl: 'https://randomuser.me/api/portraits/thumb/men/$randomInt.jpg',
        photoBlurhash: DefaultProfileData.photoBlurhash,
      );
    case _Gender.female:
      return SocialProfileEntity(
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
  Future<List<PresenceEntity>> query(PresenceQueryOptionsEntity queryOptions) async {
    await Future.delayed(Duration(seconds: 1));
    return Future.sync(() {
      return List<PresenceEntity>.generate(queryOptions.limit, (index) {
        _Gender randomGender = Random().nextInt(2) % 2 == 0 ? _Gender.male : _Gender.female;
        return PresenceEntity(
          id: _faker.guid.guid(),
          profile: _randomPublicProfile(randomGender),
          startedAt: DateTime.now().subtract(Duration(minutes: 1 + index * 3)),
        );
      });
    });
  }

  @override
  Future<void> create(PresenceEntity model) {
    throw UnimplementedError();
  }

  @override
  Future<void> delete(String id) {
    throw UnimplementedError();
  }

  @override
  Stream<List<PresenceEntity>> queryStream(PresenceQueryOptionsEntity queryOptions) {
    throw UnimplementedError();
  }

  @override
  Future<PresenceEntity> read(String id, {bool preferCache = false}) {
    throw UnimplementedError();
  }

  @override
  Stream<PresenceEntity> readStream(String id) {
    throw UnimplementedError();
  }

  @override
  Future<void> update(PresenceEntity model) {
    throw UnimplementedError();
  }

}
