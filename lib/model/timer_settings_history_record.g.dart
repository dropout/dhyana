// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_settings_history_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TimerSettingsHistoryRecord _$TimerSettingsHistoryRecordFromJson(
        Map<String, dynamic> json) =>
    _TimerSettingsHistoryRecord(
      id: json['id'] as String,
      timerSettings:
          TimerSettings.fromJson(json['timerSettings'] as Map<String, dynamic>),
      useCount: (json['useCount'] as num).toInt(),
      lastUsed: DateTime.parse(json['lastUsed'] as String),
    );

Map<String, dynamic> _$TimerSettingsHistoryRecordToJson(
        _TimerSettingsHistoryRecord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timerSettings': instance.timerSettings.toJson(),
      'useCount': instance.useCount,
      'lastUsed': instance.lastUsed.toIso8601String(),
    };
