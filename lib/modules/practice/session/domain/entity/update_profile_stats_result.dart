import 'package:dhyana/modules/profile/profile_module.dart';
import 'package:dhyana/modules/practice/session/public/model/session.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'update_profile_stats_result.freezed.dart';

@freezed
sealed class UpdateProfileStatsResult with _$UpdateProfileStatsResult {
  const UpdateProfileStatsResult._();

  const factory UpdateProfileStatsResult({
    required Profile oldProfile,
    required Profile updatedProfile,
    required Session session,
  }) = _UpdateProfileStatsResult;

}
