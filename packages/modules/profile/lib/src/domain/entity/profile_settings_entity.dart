import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_settings_entity.freezed.dart';
part 'profile_settings_entity.g.dart';

@freezed
sealed class ProfileSettingsEntity with _$ProfileSettingsEntity {
  
  const factory ProfileSettingsEntity({
    @Default(true) bool showStats,
    @Default(true) bool usePresenceFeature,
    // Set manually in the database to enable the stats audit trail.
    @Default(false) bool statsAuditEnabled,
  }) = _ProfileSettingsEntity;

  factory ProfileSettingsEntity.fromJson(Map<String, Object?> json) =>
    _$ProfileSettingsEntityFromJson(json);

}
