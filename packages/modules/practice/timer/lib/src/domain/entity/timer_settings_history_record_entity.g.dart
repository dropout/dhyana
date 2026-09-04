// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_settings_history_record_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TimerSettingsHistoryRecordEntity _$TimerSettingsHistoryRecordEntityFromJson(
  Map<String, dynamic> json,
) => _TimerSettingsHistoryRecordEntity(
  id: json['id'] as String,
  timerSettings: TimerSettingsEntity.fromJson(
    json['timerSettings'] as Map<String, dynamic>,
  ),
  useCount: (json['useCount'] as num).toInt(),
  lastUsed: DateTime.parse(json['lastUsed'] as String),
);

Map<String, dynamic> _$TimerSettingsHistoryRecordEntityToJson(
  _TimerSettingsHistoryRecordEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'timerSettings': instance.timerSettings,
  'useCount': instance.useCount,
  'lastUsed': instance.lastUsed.toIso8601String(),
};
