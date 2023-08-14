import 'dart:typed_data';

import 'package:dhyana/model/profile.dart';

abstract interface class ProfileRepository {

  Future<Profile> getProfileById(String id);
  Stream<Profile> getProfileStreamById(String id);

  Future<List<Profile>> getProfiles();
  Stream<List<Profile>> getProfilesStream();

  Future<void> createProfile(Profile profile);
  Future<Profile> updateProfileData(Profile profile);
  Future<Profile> updateProfileDataWithImage(
    Profile profile,
    Uint8List imageData,
  );
  Future<void> deleteProfile(String id);

}
