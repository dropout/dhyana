import 'package:faker/faker.dart';
import 'package:profile/src/domain/entity/consecutive_days_entity.dart';
import 'package:profile/src/domain/entity/milestone_progress_entity.dart';
import 'package:profile/src/domain/entity/profile_entity.dart';
import 'package:profile/src/domain/entity/profile_settings_entity.dart';
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

  ProfileEntity createProfileEntity({
    ProfileStatsReportEntity statsReport = const ProfileStatsReportEntity(),
    ProfileSettingsEntity settings = const ProfileSettingsEntity(),
  }) {
    return ProfileEntity(
      id: faker.guid.guid(),
      firstName: faker.person.firstName(),
      lastName: faker.person.lastName(),
      email: faker.internet.email(),
      photoUrl: faker.profilePhotoUrl(),
      photoBlurhash: faker.profilePhotoBlurhash(),
      signupDate: DateTime.now(),
      settings: settings,
      statsReport: statsReport,
      completed: faker.randomGenerator.boolean(),
    );
  }

  ProfileStatsReportEntity createProfileStatsReportEntity({
    int consecutiveDays = 0,
    int milestoneDays = 0,
    DateTime? lastSessionDate,
    DateTime? lastChecked,
  }) {
    return ProfileStatsReportEntity(
      consecutiveDays: ConsecutiveDaysEntity(
        current: consecutiveDays,
        lastChecked: lastChecked,
      ),
      milestoneProgress: MilestoneProgressEntity(
        completedDaysCount: milestoneDays,
      ),
      lastSessionDate: lastSessionDate,
    );
  }

  List<ProfileEntity> createProfileEntities(int count) {
    return List.generate(count, (_) => createProfileEntity());
  }

}
