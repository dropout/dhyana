import 'package:faker/faker.dart';

import 'package:social/src/domain/entity/presence_entity.dart';
import 'package:social/src/domain/entity/social_profile_entity.dart';

extension FakerSocialExtension on Faker {
  PresenceEntity createPresenceEntity() {
    return PresenceEntity(
      id: faker.guid.guid(),
      startedAt: faker.date.dateTime(),
      profile: SocialProfileEntity(
        id: faker.guid.guid(),
        firstName: faker.person.firstName(),
        lastName: faker.person.lastName(),
        photoUrl: faker.internet.httpsUrl(),
        photoBlurhash: null,        
      ),

    );
  }
}