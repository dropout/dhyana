// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consecutive_days.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ConsecutiveDays _$ConsecutiveDaysFromJson(Map<String, dynamic> json) =>
    _ConsecutiveDays(
      current: (json['current'] as num?)?.toInt() ?? 0,
      longest: (json['longest'] as num?)?.toInt() ?? 0,
      startedAt: const DateTimeOrNullConverter().fromJson(
        (json['startedAt'] as num?)?.toInt(),
      ),
      lastChecked: const DateTimeOrNullConverter().fromJson(
        (json['lastChecked'] as num?)?.toInt(),
      ),
    );

Map<String, dynamic> _$ConsecutiveDaysToJson(
  _ConsecutiveDays instance,
) => <String, dynamic>{
  'current': instance.current,
  'longest': instance.longest,
  'startedAt': const DateTimeOrNullConverter().toJson(instance.startedAt),
  'lastChecked': const DateTimeOrNullConverter().toJson(instance.lastChecked),
};
