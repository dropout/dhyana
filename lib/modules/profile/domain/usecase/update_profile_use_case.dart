import 'dart:typed_data';

import 'package:dhyana/core/domain/entity/location.dart';
import 'package:dhyana/core/domain/repository/storage_repository.dart';
import 'package:dhyana/core/domain/repository/profile_repository.dart';
import 'package:dhyana/core/util/blurhash.dart';
import 'package:dhyana/core/util/logger_mixin.dart';
import 'package:dhyana/core/domain/entity/profile/profile.dart';

class UpdateProfileUseCase with LoggerMixin {

  final ProfileRepository profileRepository;
  final StorageRepository storageRepository;
  
  UpdateProfileUseCase({
    required this.profileRepository,
    required this.storageRepository,
  });

  Future<Profile> execute({
    required Profile profile,
    required Map<String, dynamic> updatedFields,
    bool completeProfile = false,
  }) async {
    Profile updatedProfile = profile.copyWith(
      firstName: _getFirstName(updatedFields) ?? profile.firstName,
      lastName:  _getLastName(updatedFields) ?? profile.lastName,
      completed: (completeProfile) ? true : profile.completed,
      location: _getLocation(updatedFields),
    );

    Uint8List? imageData = _getImageData(updatedFields);
    if (imageData == null) {
      logger.t('Updating profile with data only');
      await profileRepository.update(updatedProfile);
      return updatedProfile;
    } else {
      logger.t('Updating profile with data and image');

      // First upload the image to storage
      await storageRepository.uploadProfileImage(profile.id, imageData);

      // If successful, update the profile with the blurhash from the new image      
      final blurHash = createBlurHash(imageData);
      updatedProfile = updatedProfile.copyWith(photoBlurhash: blurHash);
      await profileRepository.update(updatedProfile);

      return updatedProfile;
    }
  }


  // These methods probably should be moved to its own entity
  // but for pragmatic reasons, they are kept here for now.
  String? _getFirstName(Map<String,dynamic> formData) {
    if (!formData.containsKey('firstName')) {
      return null;
    }
    return formData['firstName'] as String;
  }

  String? _getLastName(Map<String,dynamic> formData) {
    if (!formData.containsKey('lastName')) {
      return null;
    }
    return formData['lastName'] as String;
  }

  Uint8List? _getImageData(Map<String,dynamic> formData) {
    if (formData.containsKey('imageData') == false || formData['imageData'] == null) {
      return null;
    }
    return formData['imageData'] as Uint8List;
  }

  Location? _getLocation(Map<String,dynamic> formData) {
    if (formData.containsKey('location') == false || formData['location'] == null) {
      return null;
    }
    return formData['location'] as Location;
  }

}