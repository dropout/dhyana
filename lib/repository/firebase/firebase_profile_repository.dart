import 'dart:typed_data';

import 'package:dhyana/data_provider/all.dart';
import 'package:dhyana/model/all.dart';
import 'package:dhyana/repository/crud_repository_operations.dart';
import 'package:dhyana/repository/profile_repository.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseProfileRepository
    extends CrudRepositoryOps<Profile>
    implements ProfileRepository {

  final ProfileDataProvider profileDataProvider;
  final StorageDataProvider storageDataProvider;

  const FirebaseProfileRepository({
    required this.profileDataProvider,
    required this.storageDataProvider,
  }) : super(profileDataProvider);

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
  Future<List<Profile>> query(ProfileQueryOptions queryOptions) =>
      profileDataProvider.query(queryOptions);

  @override
  Stream<List<Profile>> queryStream(ProfileQueryOptions queryOptions) =>
      profileDataProvider.queryStream(queryOptions);

}
