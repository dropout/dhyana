// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Session _$$_SessionFromJson(Map<String, dynamic> json) => _$_Session(
      id: json['id'] as String,
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      duration: Duration(microseconds: json['duration'] as int),
      timerSettings:
          TimerSettings.fromJson(json['timerSettings'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SessionToJson(_$_Session instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'duration': instance.duration.inMicroseconds,
      'timerSettings': instance.timerSettings.toJson(),
    };
