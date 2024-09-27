// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'year.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$YearImpl _$$YearImplFromJson(Map<String, dynamic> json) => _$YearImpl(
      id: json['id'] as String,
      date: const DateTimeConverter().fromJson((json['date'] as num).toInt()),
      sessionCount: (json['sessionCount'] as num).toInt(),
      minutes: (json['minutes'] as num).toInt(),
    );

Map<String, dynamic> _$$YearImplToJson(_$YearImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': const DateTimeConverter().toJson(instance.date),
      'sessionCount': instance.sessionCount,
      'minutes': instance.minutes,
    };
