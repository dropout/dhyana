// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DayImpl _$$DayImplFromJson(Map<String, dynamic> json) => _$DayImpl(
      id: json['id'] as String,
      date: const DateTimeConverter().fromJson((json['date'] as num).toInt()),
      sessions: (json['sessions'] as List<dynamic>?)
              ?.map((e) => Session.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      minutes: (json['minutes'] as num?)?.toInt() ?? 0,
      sessionCount: (json['sessionCount'] as num?)?.toInt() ?? 0,
      consecutiveDays: (json['consecutiveDays'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$DayImplToJson(_$DayImpl instance) => <String, dynamic>{
      'id': instance.id,
      'date': const DateTimeConverter().toJson(instance.date),
      'sessions': instance.sessions.map((e) => e.toJson()).toList(),
      'minutes': instance.minutes,
      'sessionCount': instance.sessionCount,
      'consecutiveDays': instance.consecutiveDays,
    };
