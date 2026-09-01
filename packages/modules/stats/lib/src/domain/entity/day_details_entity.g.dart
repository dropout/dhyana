// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_details_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DayDetailsEntity _$DayDetailsEntityFromJson(
  Map<String, dynamic> json,
) => _DayDetailsEntity(
  id: json['id'] as String,
  startDate: DateTime.parse(json['startDate'] as String),
  sessions:
      (json['sessions'] as List<dynamic>?)
          ?.map((e) => StatsSessionEntity.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  consecutiveDaysCount: (json['consecutiveDaysCount'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$DayDetailsEntityToJson(_DayDetailsEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startDate': instance.startDate.toIso8601String(),
      'sessions': instance.sessions,
      'consecutiveDaysCount': instance.consecutiveDaysCount,
    };
