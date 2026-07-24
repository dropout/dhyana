import 'package:dhyana/modules/account/domain/model/profile.dart';
import 'package:dhyana/modules/practice/session/domain/model/session.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

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
