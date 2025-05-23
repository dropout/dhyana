import 'package:dhyana/model/all.dart';
import 'package:dhyana/util/all.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/repository/statistics_repository.dart';
import 'package:dhyana/service/crashlytics_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'days_event.dart';
part 'days_state.dart';
part 'days_bloc.freezed.dart';

class DaysBloc extends Bloc<DaysEvent, DaysState> {

  final Logger logger = getLogger('DaysBloc');

  final StatisticsRepository statisticsRepository;
  final CrashlyticsService crashlyticsService;

  DaysBloc({
    required this.statisticsRepository,
    required this.crashlyticsService,
  }) : super(const DaysState.loading()) {
    on<QueryDaysEvent>(_onQueryDaysEvent);
  }

  void _onQueryDaysEvent(QueryDaysEvent event, emit) async {
    try {
      logger.t('Loading days: ${event.from} ... ${event.to}');
      emit(const DaysState.loading());
      DayQueryOptions queryOptions = DayQueryOptions(
        from: event.from,
        to: event.to,
      );

      List<Day> days = await statisticsRepository.queryDays(
        event.profileId,
        queryOptions,
      );
      days = _fillEmptyDays(days, queryOptions);

      emit(DaysState.loaded(
        from: event.from,
        to: event.to,
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
