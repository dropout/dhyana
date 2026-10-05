import 'package:profile/src/public/model/profile_session.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'milestone_progress.freezed.dart';

@freezed
sealed class MilestoneProgress with _$MilestoneProgress {

  const MilestoneProgress._();

  const factory MilestoneProgress({
    @Default(0) int completedDaysCount,
    @Default(7) int targetDaysCount,
    @Default([]) List<ProfileSession> sessions,
  }) = _MilestoneProgress;

  int get remainingDaysCount => targetDaysCount - completedDaysCount;

}
