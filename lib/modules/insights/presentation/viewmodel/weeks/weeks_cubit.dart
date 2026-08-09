import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/modules/insights/domain/entity/calculated_stats.dart';
import 'package:dhyana/modules/insights/domain/entity/week.dart';
import 'package:dhyana/modules/insights/domain/repository/statistics_repository.dart';
import 'package:dhyana/core/service/crashlytics_service.dart';
import 'package:dhyana/core/util/date_time_utils.dart';
import 'package:dhyana/core/util/logger_mixin.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weeks_state.dart';
part 'weeks_cubit.freezed.dart';

class WeeksCubit extends Cubit<WeeksState> with LoggerMixin {

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
      List<Week> weeks = await statisticsRepository.queryWeeks(
        profileId,
        from: from,
        to: to,
      );

      emit(WeeksState.loaded(
        from: from,
        to: to,
        weeks: _fillEmptyWeeks(weeks, from: from, to: to),
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

  List<Week> _fillEmptyWeeks(List<Week> weeks, {required DateTime from, required DateTime to}) {

    Duration diff = to.difference(from);
    int weeksCount = (diff.inDays / 7).ceil();

    logger.t('Querying $weeksCount window');
    logger.t('Got ${weeks.length} from database');

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
