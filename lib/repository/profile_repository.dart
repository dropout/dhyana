import 'dart:typed_data';

import 'package:dhyana/model/profile.dart';

abstract interface class ProfileRepository {

  Future<void> createProfile(Profile profile);
  Future<Profile> readProfileById(String id);
  Stream<Profile> readProfileStreamById(String id);
  Future<void> updateProfile(Profile profile);
  Future<Profile> updateProfileWithImage(
    Profile profile,
    Uint8List imageData,
  );
  Future<void> deleteProfile(String id);
  Future<List<Profile>> queryProfiles();
  Stream<List<Profile>> queryProfilesStream();

}
