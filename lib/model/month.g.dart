// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'month.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Month _$MonthFromJson(Map<String, dynamic> json) => _Month(
      id: json['id'] as String,
      startDate: const DateTimeConverter()
          .fromJson((json['startDate'] as num).toInt()),
      minutesCount: (json['minutesCount'] as num?)?.toInt() ?? 0,
      sessionCount: (json['sessionCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$MonthToJson(_Month instance) => <String, dynamic>{
      'id': instance.id,
      'startDate': const DateTimeConverter().toJson(instance.startDate),
      'minutesCount': instance.minutesCount,
      'sessionCount': instance.sessionCount,
    };
