import 'package:dhyana/modules/practice/session/domain/entity/update_profile_stats_result.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_completed_data.freezed.dart';

@freezed
class SessionCompletedData with _$SessionCompletedData {

  const SessionCompletedData._();

  const factory SessionCompletedData.initial() = SessionCompletedInitialData;
  const factory SessionCompletedData.loading() = SessionCompletedLoadingData;
  const factory SessionCompletedData.error() = SessionCompletedErrorData;

  const factory SessionCompletedData.saving({
    required UpdateProfileStatsResult updateResult,
  }) = SessionCompletedSavingData;

  const factory SessionCompletedData.saved({
    required UpdateProfileStatsResult updateResult,

  }) = SessionCompletedSavedData;

}
