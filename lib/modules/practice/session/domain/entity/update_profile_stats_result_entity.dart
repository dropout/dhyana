import 'package:dhyana/modules/practice/session/domain/entity/session_entity.dart';
import 'package:dhyana/modules/profile/profile_module.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

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
