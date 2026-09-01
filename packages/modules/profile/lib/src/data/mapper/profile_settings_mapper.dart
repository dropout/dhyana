import 'package:profile/src/domain/entity/profile_settings_entity.dart';
import 'package:profile/src/public/model/profile_settings.dart';

extension ProfileSettingsEntityMapper on ProfileSettingsEntity {
	ProfileSettings toApi() {
		return ProfileSettings(
			showStatsOnFinishScreen: showStatsOnFinishScreen,
			usePresenceFeature: usePresenceFeature,
		);
	}
}

extension ProfileSettingsMapper on ProfileSettings {
  ProfileSettingsEntity toDomain() {
    return ProfileSettingsEntity(
      showStatsOnFinishScreen: showStatsOnFinishScreen,
      usePresenceFeature: usePresenceFeature,
    );
  }
}