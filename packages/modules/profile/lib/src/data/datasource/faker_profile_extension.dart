import 'package:faker/faker.dart';
import 'package:profile/src/domain/entity/profile_entity.dart';
import 'package:profile/src/domain/entity/profile_stats_report_entity.dart';
import 'package:profile/src/public/model/profile.dart';
import 'package:profile/src/public/model/profile_stats_report.dart';


extension FakerProfileExtension on Faker {

  String profilePhotoUrl() {
    return 'https://picsum.photos/seed/${faker.guid.guid()}/10/10';
  }

  String profilePhotoBlurhash() {
    return 'LEHV6nWB2yk8pyo0adR*.7kCMdnj';
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

  List<Profile> createProfiles(int count) {
    return List.generate(count, (_) => createProfile());
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

  List<ProfileEntity> createProfileEntities(int count) {
    return List.generate(count, (_) => createProfileEntity());
  }

}
