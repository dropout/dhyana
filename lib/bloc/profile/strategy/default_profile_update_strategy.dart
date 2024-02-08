import 'dart:typed_data';

import 'package:dhyana/bloc/profile/strategy/profile_update_strategy.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/repository/profile_repository.dart';
import 'package:dhyana/util/logger_factory.dart';
import 'package:logger/logger.dart';

class DefaultProfileUpdateStrategy extends ProfileUpdateStrategy {

  Logger logger = getLogger('DefaultProfileUpdateStrategy');

  final Profile profile;
  final Map<String, dynamic> formData;
  final ProfileRepository profileRepository;
  final bool completeProfile;

  DefaultProfileUpdateStrategy({
    required this.profile,
    required this.formData,
    required this.profileRepository,
    required this.completeProfile,
  });

  @override
  Future<Profile> execute() async {
    Profile newProfile = profile.copyWith(
      firstName: getFirstName(formData) ?? profile.firstName,
      lastName:  getLastName(formData) ?? profile.lastName,
      completed: (completeProfile) ? true : profile.completed,
    );

    Uint8List? imageData = getImageData(formData);
    if (imageData == null) {
      logger.t('Updating profile with data only');
      return profileRepository.updateProfileData(newProfile);
    } else {
      logger.t('Updating profile with data and image');
      return profileRepository.updateProfileDataWithImage(newProfile, imageData);
    }
  }

}
