// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consecutive_days.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsecutiveDaysImpl _$$ConsecutiveDaysImplFromJson(
        Map<String, dynamic> json) =>
    _$ConsecutiveDaysImpl(
      count: (json['count'] as num?)?.toInt() ?? 0,
      startedAt: const DateTimeOrNullConverter()
          .fromJson((json['startedAt'] as num?)?.toInt()),
      lastChecked: const DateTimeOrNullConverter()
          .fromJson((json['lastChecked'] as num?)?.toInt()),
    );

Map<String, dynamic> _$$ConsecutiveDaysImplToJson(
        _$ConsecutiveDaysImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'startedAt': const DateTimeOrNullConverter().toJson(instance.startedAt),
      'lastChecked':
          const DateTimeOrNullConverter().toJson(instance.lastChecked),
    };
