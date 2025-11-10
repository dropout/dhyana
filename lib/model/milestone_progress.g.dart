// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'milestone_progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MilestoneProgress _$MilestoneProgressFromJson(Map<String, dynamic> json) =>
    _MilestoneProgress(
      completedDaysCount: (json['completedDaysCount'] as num?)?.toInt() ?? 0,
      targetDaysCount: (json['targetDaysCount'] as num?)?.toInt() ?? 7,
      sessions:
          (json['sessions'] as List<dynamic>?)
              ?.map((e) => Session.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$MilestoneProgressToJson(_MilestoneProgress instance) =>
    <String, dynamic>{
      'completedDaysCount': instance.completedDaysCount,
      'targetDaysCount': instance.targetDaysCount,
      'sessions': instance.sessions.map((e) => e.toJson()).toList(),
    };
