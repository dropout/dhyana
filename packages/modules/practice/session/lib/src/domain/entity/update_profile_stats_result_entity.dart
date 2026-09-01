import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'package:profile/profile.dart';
import 'package:session/src/domain/entity/session_entity.dart';


part 'update_profile_stats_result_entity.freezed.dart';

@freezed
sealed class UpdateProfileStatsResultEntity with _$UpdateProfileStatsResultEntity {
  const UpdateProfileStatsResultEntity._();

  const factory UpdateProfileStatsResultEntity({
    required Profile oldProfile,
    required Profile updatedProfile,
    required SessionEntity session,
  }) = _UpdateProfileStatsResultEntity;

}
