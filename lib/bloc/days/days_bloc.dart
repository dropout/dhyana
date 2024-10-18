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
    on<GetDaysEvent>(_onGetDaysEvent);
  }

  void _onGetDaysEvent(GetDaysEvent event, emit) async {
    try {
      logger.t('Loading days: ${event.from} ... ${event.to}');
      emit(const DaysState.loading());
      DayQueryOptions queryOptions = DayQueryOptions(
          from: event.from,
          to: event.to ?? DateTime.now()
      );
      List<Day> days = await statisticsRepository.queryDays(
        event.profileId,
        queryOptions,
      );

      emit(DaysState.loaded(days: _fillEmptyDays(days, queryOptions)));
      logger.t('Successfully loaded days ${days.length}');

    } catch (e, stack) {
      logger.t('Failed to get days');
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to add session'
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
        date: DateTime(from.year, from.month, from.day + i),
      ));
      result.add(d);
    }
    return result;
  }

}
