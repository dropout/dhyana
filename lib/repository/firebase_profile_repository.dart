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
    return profileDataProvider.getItemById(id);
  }

  @override
  Stream<Profile> getProfileStreamById(String id) {
    return profileDataProvider.getItemStreamById(id);
  }

  @override
  Future<List<Profile>> getProfiles() {
    return profileDataProvider.getItems(const ProfileQueryOptions());
  }

  @override
  Stream<List<Profile>> getProfilesStream() {
    return profileDataProvider.getItemsStream(const ProfileQueryOptions());
  }

  @override
  Future<void> createProfile(Profile profile) {
    return profileDataProvider.setItem(profile);
  }

  @override
  Future<Profile> updateProfileData(Profile profile) async {
    await profileDataProvider.updateItem(profile);
    return profile;
  }

  @override
  Future<void> deleteProfile(String id) {
    return profileDataProvider.deleteItem(id);
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
    await profileDataProvider.updateItem(profile);

    return newProfile;
  }

}
