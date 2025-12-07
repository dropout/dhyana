// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileSettings _$ProfileSettingsFromJson(Map<String, dynamic> json) =>
    _ProfileSettings(
      id: json['id'] as String,
      showTimeOnTimerSettingsScreen:
          json['showTimeOnTimerSettingsScreen'] as bool? ?? false,
      showStatsOnFinishScreen: json['showStatsOnFinishScreen'] as bool? ?? true,
      usePresenceFeature: json['usePresenceFeature'] as bool? ?? true,
    );

Map<String, dynamic> _$ProfileSettingsToJson(_ProfileSettings instance) =>
    <String, dynamic>{
      'id': instance.id,
      'showTimeOnTimerSettingsScreen': instance.showTimeOnTimerSettingsScreen,
      'showStatsOnFinishScreen': instance.showStatsOnFinishScreen,
      'usePresenceFeature': instance.usePresenceFeature,
    };
