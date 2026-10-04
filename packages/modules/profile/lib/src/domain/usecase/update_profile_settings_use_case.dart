import 'package:profile/src/domain/entity/profile_entity.dart';
import 'package:profile/src/domain/entity/profile_settings_entity.dart';
import 'package:profile/src/domain/repository/profile_repository.dart';

class UpdateProfileSettingsUseCase {
  final ProfileRepository profileRepository;

  UpdateProfileSettingsUseCase({required this.profileRepository});

  Future<ProfileEntity> execute({
    required ProfileEntity profileEntity,
    required Map<String, dynamic> updatedFields,
  }) async {

    // Existing fields are preserved and merged with the updated fields
    final updatedSettings = ProfileSettingsEntity.fromJson({
      ...profileEntity.settings.toJson(),
      ...updatedFields,
    });

    // Update the profile
    final updatedProfileEntity = profileEntity.copyWith(
      settings: updatedSettings,
    );

    // Save the profile
    await profileRepository.update(updatedProfileEntity);
    
    return updatedProfileEntity;
  }
}
