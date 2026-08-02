import 'package:dhyana/core/domain/entity/profile/profile.dart';
import 'package:dhyana/core/domain/entity/session.dart';

abstract class ProfileService {

  Future<Profile> loadProfile(String profileId);
  Stream<Profile> readStream(String profileId);

  Future<({Profile originalProfile, Profile updatedProfile})> updateProfileStatsWithSession(
    String profileId,
    Session session,
  );

}