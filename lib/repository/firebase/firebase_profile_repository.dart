import 'dart:typed_data';

import 'package:dhyana/data_provider/all.dart';
import 'package:dhyana/model/all.dart';
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
  Future<void> createProfile(Profile profile) =>
      profileDataProvider.create(profile);

  @override
  Future<Profile> readProfileById(String id) => profileDataProvider.read(id);

  @override
  Stream<Profile> readProfileStreamById(String id) =>
      profileDataProvider.readStream(id);

  @override
  Future<void> updateProfile(Profile profile) =>
      profileDataProvider.update(profile);

  @override
  Future<void> deleteProfile(String id) => profileDataProvider.delete(id);

  @override
  Future<Profile> updateProfileWithImage(
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

  @override
  Future<List<Profile>> queryProfiles() =>
      profileDataProvider.query(const ProfileQueryOptions());

  @override
  Stream<List<Profile>> queryProfilesStream() =>
      profileDataProvider.queryStream(const ProfileQueryOptions());

}
