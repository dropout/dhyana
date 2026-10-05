import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:core/core.dart';
import 'package:social/src/public/model/social_profile.dart';


part 'presence.freezed.dart';

@freezed
sealed class Presence with _$Presence {

  const Presence._();

  const factory Presence({
    required String id,
    required SocialProfile profile,
    @DateTimeConverter() required DateTime startedAt,
    Location? location,
  }) = _Presence;

  static List<Presence> fakeList({int count = 12}) {
    return List.generate(count, (index) {
      final randomInt = Random().nextInt(100);
      final isMale = Random().nextBool();
      return Presence(
        id: 'presence-$index',
        profile: SocialProfile(
          id: 'profile-$index',
          firstName: _randomName(isMale ? maleFirstnames : femaleFirstnames),
          lastName: _randomName(lastNames),
          photoUrl:
              'https://randomuser.me/api/portraits/thumb/${isMale ? 'men' : 'women'}/$randomInt.jpg',
          photoBlurhash: 'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
        ),
        startedAt: DateTime.now(),
      );
    });
  }

}

final List<String> maleFirstnames = ['James', 'John', 'Robert', 'Michael', 'William', 'David', 'Richard', 'Joseph', 'Thomas', 'Charles', 'Christopher', 'Daniel', 'Matthew', 'Anthony', 'Donald', 'Mark', 'Paul', 'Steven', 'Andrew', 'Kenneth'];
final List<String> femaleFirstnames = ['Olivia', 'Ava', 'Sophia', 'Isabella', 'Mia', 'Amelia', 'Harper', 'Evelyn', 'Abigail', 'Ella', 'Avery', 'Scarlett', 'Grace', 'Madison', 'Lily', 'Chloe', 'Aria', 'Zoey', 'Charlotte'];
final List<String> lastNames = ['Smith', 'Johnson', 'Williams', 'Brown', 'Jones', 'Garcia', 'Martinez', 'Rodriguez', 'Wilson', 'Anderson', 'Thomas', 'Taylor', 'Moore', 'Jackson', 'Martin', 'Lee', 'Perez', 'Thompson', 'White', 'Harris'];

String _randomName(List<String> names) {
  return names[Random().nextInt(names.length)];
}

