import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'package:profile/profile.dart';
import 'package:session/src/public/model/session.dart';


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
