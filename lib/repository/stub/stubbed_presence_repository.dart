import 'dart:math';

import 'package:dhyana/model/presence.dart';
import 'package:dhyana/model/public_profile.dart';
import 'package:dhyana/repository/all.dart';
import 'package:dhyana/util/all.dart';
import 'package:faker/faker.dart';

final List<String> firstNames = ['Liam', 'Olivia', 'Noah', 'Emma', 'Oliver', 'Ava', 'Elijah', 'Sophia', 'William', 'Isabella', 'James', 'Mia', 'Benjamin', 'Charlotte', 'Lucas', 'Amelia', 'Henry', 'Harper', 'Alexander', 'Evelyn'];

String randomFirstName() {
  return firstNames[Random().nextInt(firstNames.length)];
}

class StubbedPresenceRepository implements PresenceRepository {

  Faker _faker = Faker();

  @override
  Future<List<Presence>> getPresence(String? ownProfileId) async {
    await Future.delayed(Duration(seconds: 1));
    return Future.sync(() {
      return List<Presence>.generate(20, (index) {
        return Presence(
          id: 'presence-id-$index',
          profile: PublicProfile(
            id: _faker.guid.guid(),
            firstName: randomFirstName(),
            lastName: 'Lastname',
            photoUrl: 'https://randomuser.me/api/portraits/thumb/men/${index}.jpg',
            photoBlurhash: DefaultProfileData.photoBlurhash,
          ),
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
