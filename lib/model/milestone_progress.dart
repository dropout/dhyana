import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'session.dart';

part 'milestone_progress.freezed.dart';
part 'milestone_progress.g.dart';

// When editing profile make sure to check the profile model
// in firebase functions, because thats where the
// initial profile db record is created.

@freezed
class MilestoneProgress with _$MilestoneProgress {

  const MilestoneProgress._();

  const factory MilestoneProgress({
    @Default(0) int completedDaysCount,
    @Default(7) int targetDaysCount,
    @Default([]) List<Session> sessions,
  }) = _MilestoneProgress;

  factory MilestoneProgress.fromJson(Map<String, Object?> json) =>
    _$MilestoneProgressFromJson(json);

  int get remainingDaysCount => targetDaysCount - completedDaysCount;

}
