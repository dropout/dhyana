// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'milestone_progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MilestoneProgressImpl _$$MilestoneProgressImplFromJson(
        Map<String, dynamic> json) =>
    _$MilestoneProgressImpl(
      daysCompleted: (json['daysCompleted'] as num?)?.toInt() ?? 0,
      completedDays: (json['completedDays'] as List<dynamic>?)
              ?.map((e) => Day.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$MilestoneProgressImplToJson(
        _$MilestoneProgressImpl instance) =>
    <String, dynamic>{
      'daysCompleted': instance.daysCompleted,
      'completedDays': instance.completedDays.map((e) => e.toJson()).toList(),
    };
