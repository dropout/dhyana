import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/modules/insights/domain/entity/calculated_stats.dart';
import 'package:dhyana/modules/insights/domain/entity/day.dart';
import 'package:dhyana/modules/insights/domain/repository/statistics_repository.dart';
import 'package:dhyana/core/service/crashlytics_service.dart';
import 'package:dhyana/core/util/date_time_utils.dart';
import 'package:dhyana/core/util/logger_mixin.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'days_state.dart';
part 'days_cubit.freezed.dart';

class DaysCubit extends Cubit<DaysState> with LoggerMixin {

  final StatisticsRepository statisticsRepository;
  final CrashlyticsService crashlyticsService;

  DaysCubit({
    required this.statisticsRepository,
    required this.crashlyticsService,
  }) : super(const DaysState.loading());

  void queryDays({
    required String profileId,
    required DateTime from,
    required DateTime to,
  }) async {
    try {
      logger.t('Loading days: $from ... $to');
      emit(const DaysState.loading());


      List<Day> days = await statisticsRepository.queryDays(
        profileId,
        from: from, to: to,
      );
      days = _fillEmptyDays(days, from: from, to: to);

      emit(DaysState.loaded(
        from: from,
        to: to,
        days: days,
        calculatedStats: CalculatedStats.fromDays(days),
      ));
      logger.t('Successfully loaded days ${days.length}');

    } catch (e, stack) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Failed to load days statistics data'
      );
    }
  }

  List<Day> _fillEmptyDays(List<Day> days, {required DateTime from, required DateTime to}) {

    Duration diff = to.difference(from);
    int daysCount = diff.inDays.abs();

    logger.t('Querying $daysCount window');
    logger.t('Got ${days.length} from database');

    List<Day> result = [];
    for (var i = 0; i < daysCount; ++i) {
      String dayId = DateTime(from.year, from.month, from.day + i).toDayId();
      Day d = days.firstWhere((d) => d.id == dayId, orElse: () => Day(
        id: DateTime(from.year, from.month, from.day + i).toDayId(),
        startDate: DateTime(from.year, from.month, from.day + i),
      ));
      result.add(d);
    }
    return result;
  }

}
