import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/model/calculated_stats.dart';
import 'package:dhyana/model/week.dart';
import 'package:dhyana/model/week_query_options.dart';
import 'package:dhyana/repository/statistics_repository.dart';
import 'package:dhyana/service/crashlytics_service.dart';
import 'package:dhyana/util/date_time_utils.dart';
import 'package:dhyana/util/logger_factory.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'weeks_state.dart';
part 'weeks_cubit.freezed.dart';

class WeeksCubit extends Cubit<WeeksState> {

  final Logger logger = getLogger('WeeksCubit');

  final StatisticsRepository statisticsRepository;
  final CrashlyticsService crashlyticsService;

  WeeksCubit({
    required this.statisticsRepository,
    required this.crashlyticsService,
  }) : super(const WeeksState.loading());

  Future<void> queryWeeks(
    String profileId,
    DateTime from, {
      required DateTime to,
    }
  ) async {
    try {
      logger.t('Loading weeks: $from ... $to');
      emit(const WeeksState.loading());
      WeekQueryOptions queryOptions = WeekQueryOptions(
        from: from,
        to: to,
      );
      List<Week> weeks = await statisticsRepository.queryWeeks(
        profileId,
        queryOptions,
      );

      emit(WeeksState.loaded(
        from: from,
        to: to,
        weeks: _fillEmptyWeeks(weeks, queryOptions),
        calculatedStats: CalculatedStats.fromWeeks(weeks),
      ));
      logger.t('Successfully loaded weeks ${weeks.length}');

    } catch (e, stack) {
      logger.t('Failed to get weeks');
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to add session'
      );
    }
  }

  List<Week> _fillEmptyWeeks(List<Week> weeks, WeekQueryOptions queryOptions) {

    Duration diff = queryOptions.to.difference(queryOptions.from);
    int weeksCount = (diff.inDays / 7).ceil();

    logger.t('Querying $weeksCount window');
    logger.t('Got ${weeks.length} from database');

    final DateTime from = queryOptions.from;

    List<Week> result = [];
    for (var i = 0; i < weeksCount; ++i) {
      String weekId = DateTime(from.year, from.month, from.day + (i * 7)).toWeekId();
      Week w = weeks.firstWhere((w) => w.id == weekId, orElse: () => Week(
        id: DateTime(from.year, from.month, from.day + (i * 7)).toWeekId(),
        startDate: DateTime(from.year, from.month, from.day + (i * 7)),
      ));
      result.add(w);
    }
    return result;
  }

}
