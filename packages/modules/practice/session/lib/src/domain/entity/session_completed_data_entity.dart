import 'package:session/src/domain/entity/update_profile_stats_result_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_completed_data_entity.freezed.dart';

@freezed
class SessionCompletedDataEntity with _$SessionCompletedDataEntity {

  const SessionCompletedDataEntity._();

  const factory SessionCompletedDataEntity.initial() = SessionCompletedInitialDataEntity;
  const factory SessionCompletedDataEntity.loading() = SessionCompletedLoadingDataEntity;
  const factory SessionCompletedDataEntity.error() = SessionCompletedErrorDataEntity;

  const factory SessionCompletedDataEntity.saving({
    required UpdateProfileStatsResultEntity updateResult,
  }) = SessionCompletedSavingDataEntity;

  const factory SessionCompletedDataEntity.saved({
    required UpdateProfileStatsResultEntity updateResult,

  }) = SessionCompletedSavedDataEntity;

}
