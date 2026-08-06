import 'package:dhyana/modules/profile/domain/entity/profile_session_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'milestone_progress_entity.freezed.dart';
part 'milestone_progress_entity.g.dart';

// When editing profile make sure to check the profile model
// in firebase functions, because thats where the
// initial profile db record is created.

@freezed
sealed class MilestoneProgressEntity with _$MilestoneProgressEntity {

  const MilestoneProgressEntity._();

  const factory MilestoneProgressEntity({
    @Default(0) int completedDaysCount,
    // Update default targetDaysCount in firebase function onbeforeCreateUser too
    @Default(7) int targetDaysCount,
    @Default([]) List<ProfileSessionEntity> sessions,
  }) = _MilestoneProgressEntity;

  factory MilestoneProgressEntity.fromJson(Map<String, Object?> json) =>
    _$MilestoneProgressEntityFromJson(json);

  int get remainingDaysCount => targetDaysCount - completedDaysCount;

}
