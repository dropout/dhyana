import 'package:dhyana/modules/profile/public/model/profile.dart';
import 'package:dhyana/modules/profile/public/model/profile_session.dart';

abstract interface class ProfilePublicApi {
  Future<Profile> getProfile(String profileId, {bool preferCache = false});
  Stream<Profile> getProfileStream(String profileId);
  Future<({Profile originalProfile, Profile updatedProfile})> updateProfileStatsWithSession(
    String profileId,
    ProfileSession session,
  );
}