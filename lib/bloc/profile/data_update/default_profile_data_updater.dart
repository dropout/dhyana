import 'dart:typed_data';

import 'package:dhyana/model/profile.dart';
import 'package:dhyana/repository/profile_repository.dart';
import 'package:dhyana/util/logger_mixin.dart';

import 'profile_data_updater.dart';

class DefaultProfileDataUpdater extends ProfileDataUpdater with LoggerMixin {

  final Profile profile;
  final Map<String, dynamic> formData;
  final ProfileRepository profileRepository;
  final bool completeProfile;

  DefaultProfileDataUpdater({
    required this.profile,
    required this.formData,
    required this.profileRepository,
    required this.completeProfile,
  });

  @override
  Future<Profile> update() async {
    Profile newProfile = profile.copyWith(
      firstName: getFirstName(formData) ?? profile.firstName,
      lastName:  getLastName(formData) ?? profile.lastName,
      completed: (completeProfile) ? true : profile.completed,
      location: getLocation(formData),
    );

    Uint8List? imageData = getImageData(formData);
    if (imageData == null) {
      logger.t('Updating profile with data only');
      await profileRepository.update(newProfile);
      return newProfile;
    } else {
      logger.t('Updating profile with data and image');
      return profileRepository.updateProfileWithImage(newProfile, imageData);
    }
  }

}
