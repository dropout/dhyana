import 'package:dhyana/core/service/crashlytics_service.dart';
import 'package:dhyana/core/util/logger_mixin.dart';
import 'package:dhyana/modules/insights/insights_module.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stats_bucket_cubit.freezed.dart';

@freezed
sealed class StatsBucketState with _$StatsBucketState {
  const factory StatsBucketState.loading() = StatsBucketLoadingState;
  const factory StatsBucketState.loaded({required List<StatsBucket> buckets}) =
      StatsBucketLoadedState;
  const factory StatsBucketState.error() = StatsBucketLoadingErrorState;
}

class StatsBucketCubit extends Cubit<StatsBucketState> with LoggerMixin {

  final StatsPublicApi statsPublicApi;
  final CrashlyticsService crashlyticsService;

  StatsBucketCubit({
    required this.statsPublicApi,
    required this.crashlyticsService,
  }) : super(const StatsBucketState.loading());

  void query({
    required String profileId,
    required DateTime from,
    required DateTime to,
    required StatsGranularity granularity,
  }) async {
    emit(StatsBucketState.loading());
    try {
      logger.t('Querying stats buckets for profileId: $profileId, from: $from, to: $to, granularity: $granularity');
      emit(StatsBucketState.loading());
      final buckets = await statsPublicApi.queryBuckets(
        profileId,
        from: from,
        to: to, 
        granularity: granularity,
      );
      emit(StatsBucketState.loaded(buckets: buckets));
      logger.t('Successfully loaded ${buckets.length} stats buckets for profileId: $profileId');    
    } catch (e, stack) {
      emit(const StatsBucketState.error());
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to load stats buckets',
      );
    }


  }

}
