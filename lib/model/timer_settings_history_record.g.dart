// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_settings_history_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TimerSettingsHistoryRecordImpl _$$TimerSettingsHistoryRecordImplFromJson(
        Map<String, dynamic> json) =>
    _$TimerSettingsHistoryRecordImpl(
      id: json['id'] as String,
      timerSettings:
          TimerSettings.fromJson(json['timerSettings'] as Map<String, dynamic>),
      useCount: (json['useCount'] as num).toInt(),
      lastUsed: DateTime.parse(json['lastUsed'] as String),
    );

Map<String, dynamic> _$$TimerSettingsHistoryRecordImplToJson(
        _$TimerSettingsHistoryRecordImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timerSettings': instance.timerSettings.toJson(),
      'useCount': instance.useCount,
      'lastUsed': instance.lastUsed.toIso8601String(),
    };
