// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Day _$$_DayFromJson(Map<String, dynamic> json) => _$_Day(
      id: json['id'] as String,
      date: const DateTimeConverter().fromJson(json['date'] as Timestamp),
      sessions: (json['sessions'] as List<dynamic>)
          .map((e) => Session.fromJson(e as Map<String, dynamic>))
          .toList(),
      minutes: json['minutes'] as int,
    );

Map<String, dynamic> _$$_DayToJson(_$_Day instance) => <String, dynamic>{
      'id': instance.id,
      'date': const DateTimeConverter().toJson(instance.date),
      'sessions': instance.sessions.map((e) => e.toJson()).toList(),
      'minutes': instance.minutes,
    };
