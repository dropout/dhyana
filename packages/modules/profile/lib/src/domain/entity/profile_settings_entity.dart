import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_settings_entity.freezed.dart';
part 'profile_settings_entity.g.dart';

@freezed
sealed class ProfileSettingsEntity with _$ProfileSettingsEntity implements ProfileDispayableSettings {

  const factory ProfileSettingsEntity({
    @Default(true) bool showStatsOnFinishScreen,
    @Default(true) bool usePresenceFeature,
  }) = _ProfileSettingsEntity;

  factory ProfileSettingsEntity.fromJson(Map<String, Object?> json) =>
    _$ProfileSettingsEntityFromJson(json);

}
