// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'milestone_progress_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MilestoneProgressEntity _$MilestoneProgressEntityFromJson(
  Map<String, dynamic> json,
) => _MilestoneProgressEntity(
  completedDaysCount: (json['completedDaysCount'] as num?)?.toInt() ?? 0,
  targetDaysCount: (json['targetDaysCount'] as num?)?.toInt() ?? 7,
  sessions:
      (json['sessions'] as List<dynamic>?)
          ?.map((e) => ProfileSessionEntity.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$MilestoneProgressEntityToJson(
  _MilestoneProgressEntity instance,
) => <String, dynamic>{
  'completedDaysCount': instance.completedDaysCount,
  'targetDaysCount': instance.targetDaysCount,
  'sessions': instance.sessions,
};
