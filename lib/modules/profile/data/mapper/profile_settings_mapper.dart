import 'package:dhyana/modules/profile/domain/entity/profile_settings_entity.dart';
import 'package:dhyana/modules/profile/public/model/profile_settings.dart';

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