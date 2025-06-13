// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_settings_history_record_query_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TimerSettingsHistoryRecordQueryOptions
    _$TimerSettingsHistoryRecordQueryOptionsFromJson(
            Map<String, dynamic> json) =>
        _TimerSettingsHistoryRecordQueryOptions(
          limit: (json['limit'] as num?)?.toInt() ?? 20,
        );

Map<String, dynamic> _$TimerSettingsHistoryRecordQueryOptionsToJson(
        _TimerSettingsHistoryRecordQueryOptions instance) =>
    <String, dynamic>{
      'limit': instance.limit,
    };
