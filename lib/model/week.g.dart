// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'week.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeekImpl _$$WeekImplFromJson(Map<String, dynamic> json) => _$WeekImpl(
      id: json['id'] as String,
      startDate: const DateTimeConverter()
          .fromJson((json['startDate'] as num).toInt()),
      minutesCount: (json['minutesCount'] as num?)?.toInt() ?? 0,
      sessionCount: (json['sessionCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$WeekImplToJson(_$WeekImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startDate': const DateTimeConverter().toJson(instance.startDate),
      'minutesCount': instance.minutesCount,
      'sessionCount': instance.sessionCount,
    };
