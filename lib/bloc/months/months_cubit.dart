import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/model/month.dart';
import 'package:dhyana/model/month_query_options.dart';
import 'package:dhyana/repository/statistics_repository.dart';
import 'package:dhyana/service/crashlytics_service.dart';
import 'package:dhyana/util/all.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
      MonthQueryOptions queryOptions = MonthQueryOptions(
        from: from,
        to: to ?? DateTime.now()
      );
      List<Month> months = await statisticsRepository.queryMonths(
        profileId,
        queryOptions,
      );

      emit(MonthsState.loaded(months: _fillEmptyMonths(months, queryOptions)));
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

  List<Month> _fillEmptyMonths(List<Month> months, MonthQueryOptions queryOptions) {
    int monthsCount = DateUtils.monthDelta(
      queryOptions.from,
      queryOptions.to,
    );

    logger.t('Querying $monthsCount window');
    logger.t('Got ${months.length} from database');

    final DateTime from = queryOptions.from;

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
