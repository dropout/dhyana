// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_settings_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileSettingsEntity _$ProfileSettingsEntityFromJson(
  Map<String, dynamic> json,
) => _ProfileSettingsEntity(
  showStatsOnFinishScreen: json['showStatsOnFinishScreen'] as bool? ?? true,
  usePresenceFeature: json['usePresenceFeature'] as bool? ?? true,
);

Map<String, dynamic> _$ProfileSettingsEntityToJson(
  _ProfileSettingsEntity instance,
) => <String, dynamic>{
  'showStatsOnFinishScreen': instance.showStatsOnFinishScreen,
  'usePresenceFeature': instance.usePresenceFeature,
};
