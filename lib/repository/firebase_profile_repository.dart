import 'dart:typed_data';

import 'package:dhyana/data_provider/all.dart';
import 'package:dhyana/model/all.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/model/profile_query_options.dart';
import 'package:dhyana/repository/profile_repository.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseProfileRepository implements ProfileRepository {

  final ProfileDataProvider profileDataProvider;
  final StorageDataProvider storageDataProvider;

  const FirebaseProfileRepository({
    required this.profileDataProvider,
    required this.storageDataProvider,
  });

  @override
  Future<Profile> getProfileById(String id) {
    return profileDataProvider.read(id);
  }

  @override
  Stream<Profile> getProfileStreamById(String id) {
    return profileDataProvider.readStream(id);
  }

  @override
  Future<List<Profile>> getProfiles() {
    return profileDataProvider.query(const ProfileQueryOptions());
  }

  @override
  Stream<List<Profile>> getProfilesStream() {
    return profileDataProvider.queryStream(const ProfileQueryOptions());
  }

  @override
  Future<void> createProfile(Profile profile) {
    return profileDataProvider.create(profile);
  }

  @override
  Future<Profile> updateProfileData(Profile profile) async {
    await profileDataProvider.update(profile);
    return profile;
  }

  @override
  Future<void> deleteProfile(String id) {
    return profileDataProvider.delete(id);
  }

  @override
  Future<Profile> updateProfileDataWithImage(
    Profile profile,
    Uint8List imageData
  ) async {
    // Upload image
    UploadTask uploadTask = storageDataProvider.uploadFile(
      fileName: 'photo.jpg',
      path: '/profiles/${profile.id}',
      data: imageData
    );
    await uploadTask.whenComplete(() => null);

    // Get image url
    String photoUrl = await uploadTask.snapshot.ref.getDownloadURL();

    // Update profile with new photoUrl
    Profile newProfile = profile.copyWith(photoUrl: photoUrl);
    await profileDataProvider.update(profile);

    return newProfile;
  }

}
