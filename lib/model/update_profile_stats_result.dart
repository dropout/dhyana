import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'profile.dart';
import 'session.dart';

part 'update_profile_stats_result.freezed.dart';
part 'update_profile_stats_result.g.dart';

@freezed
sealed class UpdateProfileStatsResult with _$UpdateProfileStatsResult {
  const UpdateProfileStatsResult._();

  const factory UpdateProfileStatsResult({
    required Profile oldProfile,
    required Profile updatedProfile,
    required Session session,
  }) = _UpdateProfileStatsResult;

  factory UpdateProfileStatsResult.fromJson(Map<String, Object?> json) =>
    _$UpdateProfileStatsResultFromJson(json);
}
