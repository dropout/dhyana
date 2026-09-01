import 'package:profile/src/domain/entity/profile_entity.dart';
import 'package:profile/src/domain/entity/profile_settings_entity.dart';
import 'package:profile/src/domain/repository/profile_repository.dart';

class UpdateProfileSettingsUseCase {
  final ProfileRepository profileRepository;

  UpdateProfileSettingsUseCase({
    required this.profileRepository,
  });

  Future<ProfileEntity> execute({
    required ProfileEntity profileEntity,
    required Map<String, dynamic> updatedFields,    
  }) async {

    final updatedSettings = ProfileSettingsEntity.fromJson({...updatedFields});
    final updatedProfileEntity = profileEntity.copyWith(settings: updatedSettings);
    await profileRepository.update(updatedProfileEntity);
    return updatedProfileEntity;
  }
}