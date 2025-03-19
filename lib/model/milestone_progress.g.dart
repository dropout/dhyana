// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'milestone_progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MilestoneProgressImpl _$$MilestoneProgressImplFromJson(
        Map<String, dynamic> json) =>
    _$MilestoneProgressImpl(
      completedDaysCount: (json['completedDaysCount'] as num?)?.toInt() ?? 0,
      targetDaysCount: (json['targetDaysCount'] as num?)?.toInt() ?? 7,
      sessions: (json['sessions'] as List<dynamic>?)
              ?.map((e) => Session.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$MilestoneProgressImplToJson(
        _$MilestoneProgressImpl instance) =>
    <String, dynamic>{
      'completedDaysCount': instance.completedDaysCount,
      'targetDaysCount': instance.targetDaysCount,
      'sessions': instance.sessions.map((e) => e.toJson()).toList(),
    };
