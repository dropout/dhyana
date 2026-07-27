import 'package:dhyana/core/domain/entity/profile/profile.dart';
import 'package:dhyana/core/domain/entity/profile/profile_settings.dart';
import 'package:dhyana/modules/profile/domain/repository/profile_repository.dart';

class UpdateProfileSettingsUseCase {
  final ProfileRepository profileRepository;

  UpdateProfileSettingsUseCase({
    required this.profileRepository,
  });

  Future<Profile> execute({
    required Profile profile,
    required Map<String, dynamic> updatedFields,    
  }) async {
    final updatedSettings = ProfileSettings.fromJson({...updatedFields});
    final updatedProfile = profile.copyWith(settings: updatedSettings);
    await profileRepository.update(updatedProfile);
    return updatedProfile;
  }
}