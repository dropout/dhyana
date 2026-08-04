import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_settings_entity.freezed.dart';

@freezed
sealed class ProfileSettingsEntity with _$ProfileSettingsEntity {

  const factory ProfileSettingsEntity({
    @Default(true) bool showStatsOnFinishScreen,
    @Default(true) bool usePresenceFeature,
  }) = _ProfileSettingsEntity;

}
