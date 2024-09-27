// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'month.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MonthImpl _$$MonthImplFromJson(Map<String, dynamic> json) => _$MonthImpl(
      id: json['id'] as String,
      date: const DateTimeConverter().fromJson((json['date'] as num).toInt()),
      sessionCount: (json['sessionCount'] as num).toInt(),
      minutes: (json['minutes'] as num).toInt(),
    );

Map<String, dynamic> _$$MonthImplToJson(_$MonthImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': const DateTimeConverter().toJson(instance.date),
      'sessionCount': instance.sessionCount,
      'minutes': instance.minutes,
    };
