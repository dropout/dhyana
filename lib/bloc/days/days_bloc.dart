import 'package:dhyana/model/all.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/repository/statistics_repository.dart';
import 'package:dhyana/service/crashlytics_service.dart';
import 'package:dhyana/util/logger_factory.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'days_event.dart';
part 'days_state.dart';
part 'days_bloc.freezed.dart';

class DaysBloc extends Bloc<DaysEvent, DaysState> {

  Logger logger = getLogger('DaysBloc');

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
      List<Day> days = await statisticsRepository.queryDays(
        event.profileId,
        DayQueryOptions(
          from: event.from,
          to: event.to ?? DateTime.now()
        ),
      );
      emit(DaysState.loaded(days: days));
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

}
