// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_settings_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileSettingsEntity _$ProfileSettingsEntityFromJson(
  Map<String, dynamic> json,
) => _ProfileSettingsEntity(
  showStats: json['showStats'] as bool? ?? true,
  usePresenceFeature: json['usePresenceFeature'] as bool? ?? true,
);

Map<String, dynamic> _$ProfileSettingsEntityToJson(
  _ProfileSettingsEntity instance,
) => <String, dynamic>{
  'showStats': instance.showStats,
  'usePresenceFeature': instance.usePresenceFeature,
};
