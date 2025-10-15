import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/model/calculated_stats.dart';
import 'package:dhyana/model/day.dart';
import 'package:dhyana/model/day_query_options.dart';
import 'package:dhyana/repository/statistics_repository.dart';
import 'package:dhyana/service/crashlytics_service.dart';
import 'package:dhyana/util/date_time_utils.dart';
import 'package:dhyana/util/logger_factory.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'days_state.dart';
part 'days_cubit.freezed.dart';

class DaysCubit extends Cubit<DaysState> {

  final Logger logger = getLogger('DaysCubit');

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
      DayQueryOptions queryOptions = DayQueryOptions(
        from: from,
        to: to,
      );

      List<Day> days = await statisticsRepository.queryDays(
        profileId,
        queryOptions,
      );
      days = _fillEmptyDays(days, queryOptions);

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

  List<Day> _fillEmptyDays(List<Day> days, DayQueryOptions queryOptions) {

    Duration diff = queryOptions.to.difference(queryOptions.from);
    int daysCount = diff.inDays.abs();

    logger.t('Querying $daysCount window');
    logger.t('Got ${days.length} from database');

    final DateTime from = queryOptions.from;

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


  // const factory DaysEvent.queryDays({
  //   required String profileId,
  //   required DateTime from,
  //   required DateTime to,
  //   @Default(false) bool useStream,
  // }) = QueryDaysEvent;
  //
  // const factory DaysEvent.receiveUpdate({
  //   required List<Day> days,
  // }) = ReceiveUpdateDaysEvent;
  //
  // const factory DaysEvent.error() = DaysErrorEvent;
