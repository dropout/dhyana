import 'package:faker/faker.dart';
import 'package:profile/profile.dart';
import 'package:session/src/domain/entity/session_entity.dart';

extension FakerSessionExtension on Faker {

  Profile createProfile({
    String id = '',
    String firstName = '',
    String lastName = '',
    String email = '',
    String? photoUrl,
    String? photoBlurhash,
  }) {
    return Profile(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      photoUrl: photoUrl,
      photoBlurhash: photoBlurhash,
      signupDate: DateTime.now(),
      statsReport: const ProfileStatsReport(),
      completed: true,
    );
  }

  SessionEntity createSessionEntity({SessionEntityType type = SessionEntityType.timer}) {
    return SessionEntity(
      id: guid.guid(),
      type: type,
      startTime: DateTime.now().subtract(Duration(hours: 1)),
      endTime: DateTime.now(),
      duration: Duration(hours: 1),
    );
  }

}