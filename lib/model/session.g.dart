// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SessionImpl _$$SessionImplFromJson(Map<String, dynamic> json) =>
    _$SessionImpl(
      id: json['id'] as String,
      startTime:
          const DateTimeConverter().fromJson(json['startTime'] as Timestamp),
      endTime: const DateTimeConverter().fromJson(json['endTime'] as Timestamp),
      duration:
          const DurationConverter().fromJson((json['duration'] as num).toInt()),
      timerSettings:
          TimerSettings.fromJson(json['timerSettings'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SessionImplToJson(_$SessionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startTime': const DateTimeConverter().toJson(instance.startTime),
      'endTime': const DateTimeConverter().toJson(instance.endTime),
      'duration': const DurationConverter().toJson(instance.duration),
      'timerSettings': instance.timerSettings.toJson(),
    };
