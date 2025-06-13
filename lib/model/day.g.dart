// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Day _$DayFromJson(Map<String, dynamic> json) => _Day(
      id: json['id'] as String,
      startDate: const DateTimeConverter()
          .fromJson((json['startDate'] as num).toInt()),
      sessions: (json['sessions'] as List<dynamic>?)
              ?.map((e) => Session.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      minutesCount: (json['minutesCount'] as num?)?.toInt() ?? 0,
      sessionCount: (json['sessionCount'] as num?)?.toInt() ?? 0,
      consecutiveDaysCount:
          (json['consecutiveDaysCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$DayToJson(_Day instance) => <String, dynamic>{
      'id': instance.id,
      'startDate': const DateTimeConverter().toJson(instance.startDate),
      'sessions': instance.sessions.map((e) => e.toJson()).toList(),
      'minutesCount': instance.minutesCount,
      'sessionCount': instance.sessionCount,
      'consecutiveDaysCount': instance.consecutiveDaysCount,
    };
