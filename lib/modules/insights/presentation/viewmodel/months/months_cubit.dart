import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/modules/insights/domain/entity/month.dart';
import 'package:dhyana/modules/insights/domain/entity/stats_granularity.dart';
import 'package:dhyana/modules/insights/domain/repository/statistics_repository.dart';
import 'package:dhyana/core/service/crashlytics_service.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dhyana/core/util/logger_mixin.dart';
import 'package:dhyana/core/util/date_time_utils.dart';

part 'months_state.dart';
part 'months_cubit.freezed.dart';

class MonthsCubit extends Cubit<MonthsState> with LoggerMixin {

  final StatisticsRepository statisticsRepository;
  final CrashlyticsService crashlyticsService;

  MonthsCubit({
    required this.statisticsRepository,
    required this.crashlyticsService,
  }) : super(const MonthsState.loading());

  void queryMonths({
    required String profileId,
    required DateTime from,
    DateTime? to,
  }) async {
    try {
      logger.t('Loading months: $from ... $to');
      emit(const MonthsState.loading());

      final buckets = await statisticsRepository.queryBuckets(
        profileId,
        from: from,
        to: to ?? DateTime.now(),
        granularity: StatsGranularity.month,
      );

      final months = buckets
          .map(
            (bucket) => Month(
              id: bucket.id,
              startDate: bucket.startDate,
              minutesCount: bucket.minutesCount,
              sessionCount: bucket.sessionCount,
            ),
          )
          .toList();

      emit(MonthsState.loaded(months: _fillEmptyMonths(months, from: from, to: to ?? DateTime.now())));
      logger.t('Successfully loaded months ${months.length}');

    } catch (e, stack) {
      logger.t('Failed to get months');
      crashlyticsService.recordError(
          exception: e,
          stackTrace: stack,
          reason: 'Unable to add session'
      );
    }
  }

  List<Month> _fillEmptyMonths(List<Month> months, {required DateTime from, required DateTime to}) {
    int monthsCount = DateUtils.monthDelta(
      from,
      to,
    );

    logger.t('Querying $monthsCount window');
    logger.t('Got ${months.length} from database');

    List<Month> result = [];
    for (var i = 0; i < monthsCount; ++i) {
      String monthId = DateTime(from.year, from.month + i).toMonthId();
      Month m = months.firstWhere((m) => m.id == monthId, orElse: () => Month(
        id: DateTime(from.year, from.month + i).toMonthId(),
        startDate: DateTime(from.year, from.month + i),
        minutesCount: 0,
        sessionCount: 0,
      ));
      result.add(m);
    }

    return result;
  }

}
