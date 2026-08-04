import 'package:dhyana/core/domain/entity/session.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'milestone_progress_entity.freezed.dart';

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
    @Default([]) List<Session> sessions,
  }) = _MilestoneProgressEntity;

  int get remainingDaysCount => targetDaysCount - completedDaysCount;

}
