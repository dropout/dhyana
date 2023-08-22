// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Session _$$_SessionFromJson(Map<String, dynamic> json) => _$_Session(
      id: json['id'] as String,
      startTime:
          const DateTimeConverter().fromJson(json['startTime'] as Timestamp),
      endTime: const DateTimeConverter().fromJson(json['endTime'] as Timestamp),
      duration: const DurationConverter().fromJson(json['duration'] as int),
      timerSettings:
          TimerSettings.fromJson(json['timerSettings'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SessionToJson(_$_Session instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startTime': const DateTimeConverter().toJson(instance.startTime),
      'endTime': const DateTimeConverter().toJson(instance.endTime),
      'duration': const DurationConverter().toJson(instance.duration),
      'timerSettings': instance.timerSettings.toJson(),
    };
