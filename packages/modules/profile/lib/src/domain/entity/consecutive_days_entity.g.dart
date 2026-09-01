// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consecutive_days_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ConsecutiveDaysEntity _$ConsecutiveDaysEntityFromJson(
  Map<String, dynamic> json,
) => _ConsecutiveDaysEntity(
  current: (json['current'] as num?)?.toInt() ?? 0,
  longest: (json['longest'] as num?)?.toInt() ?? 0,
  startedAt: const DateTimeOrNullConverter().fromJson(
    (json['startedAt'] as num?)?.toInt(),
  ),
  lastChecked: const DateTimeOrNullConverter().fromJson(
    (json['lastChecked'] as num?)?.toInt(),
  ),
);

Map<String, dynamic> _$ConsecutiveDaysEntityToJson(
  _ConsecutiveDaysEntity instance,
) => <String, dynamic>{
  'current': instance.current,
  'longest': instance.longest,
  'startedAt': const DateTimeOrNullConverter().toJson(instance.startedAt),
  'lastChecked': const DateTimeOrNullConverter().toJson(instance.lastChecked),
};
