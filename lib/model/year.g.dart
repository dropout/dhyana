// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'year.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$YearImpl _$$YearImplFromJson(Map<String, dynamic> json) => _$YearImpl(
      id: json['id'] as String,
      startDate: const DateTimeConverter()
          .fromJson((json['startDate'] as num).toInt()),
      sessionCount: (json['sessionCount'] as num?)?.toInt() ?? 0,
      minutes: (json['minutes'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$YearImplToJson(_$YearImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startDate': const DateTimeConverter().toJson(instance.startDate),
      'sessionCount': instance.sessionCount,
      'minutes': instance.minutes,
    };
