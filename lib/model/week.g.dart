// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'week.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Week _$WeekFromJson(Map<String, dynamic> json) => _Week(
      id: json['id'] as String,
      startDate: const DateTimeConverter()
          .fromJson((json['startDate'] as num).toInt()),
      minutesCount: (json['minutesCount'] as num?)?.toInt() ?? 0,
      sessionCount: (json['sessionCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$WeekToJson(_Week instance) => <String, dynamic>{
      'id': instance.id,
      'startDate': const DateTimeConverter().toJson(instance.startDate),
      'minutesCount': instance.minutesCount,
      'sessionCount': instance.sessionCount,
    };
