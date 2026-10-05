// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats_bucket_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DayStatsBucketEntity _$DayStatsBucketEntityFromJson(
  Map<String, dynamic> json,
) => DayStatsBucketEntity(
  id: json['id'] as String,
  startDate: const DateTimeConverter().fromJson(
    (json['startDate'] as num).toInt(),
  ),
  minutesCount: (json['minutesCount'] as num?)?.toInt() ?? 0,
  sessionCount: (json['sessionCount'] as num?)?.toInt() ?? 0,
  $type: json['granularity'] as String?,
);

Map<String, dynamic> _$DayStatsBucketEntityToJson(
  DayStatsBucketEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'startDate': const DateTimeConverter().toJson(instance.startDate),
  'minutesCount': instance.minutesCount,
  'sessionCount': instance.sessionCount,
  'granularity': instance.$type,
};

WeekStatsBucketEntity _$WeekStatsBucketEntityFromJson(
  Map<String, dynamic> json,
) => WeekStatsBucketEntity(
  id: json['id'] as String,
  startDate: const DateTimeConverter().fromJson(
    (json['startDate'] as num).toInt(),
  ),
  minutesCount: (json['minutesCount'] as num?)?.toInt() ?? 0,
  sessionCount: (json['sessionCount'] as num?)?.toInt() ?? 0,
  $type: json['granularity'] as String?,
);

Map<String, dynamic> _$WeekStatsBucketEntityToJson(
  WeekStatsBucketEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'startDate': const DateTimeConverter().toJson(instance.startDate),
  'minutesCount': instance.minutesCount,
  'sessionCount': instance.sessionCount,
  'granularity': instance.$type,
};

MonthStatsBucketEntity _$MonthStatsBucketEntityFromJson(
  Map<String, dynamic> json,
) => MonthStatsBucketEntity(
  id: json['id'] as String,
  startDate: const DateTimeConverter().fromJson(
    (json['startDate'] as num).toInt(),
  ),
  minutesCount: (json['minutesCount'] as num?)?.toInt() ?? 0,
  sessionCount: (json['sessionCount'] as num?)?.toInt() ?? 0,
  $type: json['granularity'] as String?,
);

Map<String, dynamic> _$MonthStatsBucketEntityToJson(
  MonthStatsBucketEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'startDate': const DateTimeConverter().toJson(instance.startDate),
  'minutesCount': instance.minutesCount,
  'sessionCount': instance.sessionCount,
  'granularity': instance.$type,
};

YearStatsBucketEntity _$YearStatsBucketEntityFromJson(
  Map<String, dynamic> json,
) => YearStatsBucketEntity(
  id: json['id'] as String,
  startDate: const DateTimeConverter().fromJson(
    (json['startDate'] as num).toInt(),
  ),
  minutesCount: (json['minutesCount'] as num?)?.toInt() ?? 0,
  sessionCount: (json['sessionCount'] as num?)?.toInt() ?? 0,
  $type: json['granularity'] as String?,
);

Map<String, dynamic> _$YearStatsBucketEntityToJson(
  YearStatsBucketEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'startDate': const DateTimeConverter().toJson(instance.startDate),
  'minutesCount': instance.minutesCount,
  'sessionCount': instance.sessionCount,
  'granularity': instance.$type,
};
