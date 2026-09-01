// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_state_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TimerStateEntity _$TimerStateEntityFromJson(Map<String, dynamic> json) =>
    _TimerStateEntity(
      timerSettings: TimerSettingsEntity.fromJson(
        json['timerSettings'] as Map<String, dynamic>,
      ),
      timerStatus: $enumDecode(_$TimerStatusEnumMap, json['timerStatus']),
      timerStage: $enumDecode(_$TimerStageEnumMap, json['timerStage']),
      elapsedWarmupTime: Duration(
        microseconds: (json['elapsedWarmupTime'] as num).toInt(),
      ),
      elapsedTime: Duration(microseconds: (json['elapsedTime'] as num).toInt()),
      startTime: json['startTime'] == null
          ? null
          : DateTime.parse(json['startTime'] as String),
      endTime: json['endTime'] == null
          ? null
          : DateTime.parse(json['endTime'] as String),
    );

Map<String, dynamic> _$TimerStateEntityToJson(_TimerStateEntity instance) =>
    <String, dynamic>{
      'timerSettings': instance.timerSettings.toJson(),
      'timerStatus': _$TimerStatusEnumMap[instance.timerStatus]!,
      'timerStage': _$TimerStageEnumMap[instance.timerStage]!,
      'elapsedWarmupTime': instance.elapsedWarmupTime.inMicroseconds,
      'elapsedTime': instance.elapsedTime.inMicroseconds,
      'startTime': instance.startTime?.toIso8601String(),
      'endTime': instance.endTime?.toIso8601String(),
    };

const _$TimerStatusEnumMap = {
  TimerStatus.idle: 'idle',
  TimerStatus.running: 'running',
  TimerStatus.paused: 'paused',
  TimerStatus.completed: 'completed',
  TimerStatus.error: 'error',
};

const _$TimerStageEnumMap = {
  TimerStage.warmup: 'warmup',
  TimerStage.timer: 'timer',
};
