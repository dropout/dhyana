// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'milestone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Milestone _$MilestoneFromJson(Map<String, dynamic> json) => _Milestone(
      id: json['id'] as String,
      days: (json['days'] as List<dynamic>?)
              ?.map((e) => Day.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$MilestoneToJson(_Milestone instance) =>
    <String, dynamic>{
      'id': instance.id,
      'days': instance.days.map((e) => e.toJson()).toList(),
    };
