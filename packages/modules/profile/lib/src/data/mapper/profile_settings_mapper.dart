import 'package:profile/src/domain/entity/profile_settings_entity.dart';
import 'package:profile/src/public/model/profile_settings.dart';

extension ProfileSettingsEntityMapper on ProfileSettingsEntity {
	ProfileSettings toApi() {
		return ProfileSettings(
			showStats: showStats,
			usePresenceFeature: usePresenceFeature,
		);
	}
}

extension ProfileSettingsMapper on ProfileSettings {
  ProfileSettingsEntity toDomain() {
    return ProfileSettingsEntity(
      showStats: showStats,
      usePresenceFeature: usePresenceFeature,
    );
  }
}