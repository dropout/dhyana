import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/model/day.dart';
import 'package:dhyana/repository/day_repository.dart';
import 'package:dhyana/service/crashlytics_service.dart';
import 'package:dhyana/util/logger_factory.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'days_event.dart';
part 'days_state.dart';
part 'days_bloc.freezed.dart';

class DaysBloc extends Bloc<DaysEvent, DaysState> {

  Logger logger = getLogger('DaysBloc');

  DayRepository dayRepository;
  CrashlyticsService crashlyticsService;

  DaysBloc({
    required this.dayRepository,
    required this.crashlyticsService,
  }) : super(const DaysState.initial()) {
    on<GetDaysEvent>(_onGetDaysEvent);
  }

  void _onGetDaysEvent(GetDaysEvent event, emit) async {
    try {
      logger.v('Loading days: ${event.from} ... ${event.to}');
      emit(const DaysState.loading());
      List<Day> days = await dayRepository.getDays(
        profileId: event.profileId,
        from: event.from,
        to: event.to ?? DateTime.now(),
      );
      emit(DaysState.loaded(days: days));
      logger.v('Successfully loaded days ${days.length}');
    } catch (e, stack) {
      logger.v('Failed to get days');
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to add session'
      );
    }
  }

}
