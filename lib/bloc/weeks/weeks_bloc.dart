import 'package:dhyana/model/all.dart';
import 'package:dhyana/model/statistics_details.dart';
import 'package:dhyana/util/all.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/repository/statistics_repository.dart';
import 'package:dhyana/service/crashlytics_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'weeks_event.dart';
part 'weeks_state.dart';
part 'weeks_bloc.freezed.dart';

class WeeksBloc extends Bloc<WeeksEvent, WeeksState> {

  final Logger logger = getLogger('WeeksBloc');

  final StatisticsRepository statisticsRepository;
  final CrashlyticsService crashlyticsService;

  WeeksBloc({
    required this.statisticsRepository,
    required this.crashlyticsService,
  }) : super(const WeeksState.loading()) {
    on<GetWeeksEvent>(_onGetWeeksEvent);
  }

  void _onGetWeeksEvent(GetWeeksEvent event, emit) async {
    try {
      logger.t('Loading weeks: ${event.from} ... ${event.to}');
      emit(const WeeksState.loading());
      WeekQueryOptions queryOptions = WeekQueryOptions(
        from: event.from,
        to: event.to,
      );
      List<Week> weeks = await statisticsRepository.queryWeeks(
        event.profileId,
        queryOptions,
      );

      emit(WeeksState.loaded(
        from: event.from,
        to: event.to,
        weeks: _fillEmptyWeeks(weeks, queryOptions),
        statisticsDetails: StatisticsDetails.fromWeeks(weeks),
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
