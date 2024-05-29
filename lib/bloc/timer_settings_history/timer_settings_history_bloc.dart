import 'package:dhyana/model/timer_settings_query_options.dart';
import 'package:dhyana/util/logger_factory.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/repository/timer_settings_history_repository.dart';
import 'package:dhyana/service/crashlytics_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'timer_settings_history_event.dart';
part 'timer_settings_history_state.dart';
part 'timer_settings_history_bloc.freezed.dart';

class TimerSettingsHistoryBloc
    extends Bloc<TimerSettingsHistoryEvent, TimerSettingsHistoryState> {

  final Logger logger = getLogger('TimerSettingsHistoryBloc');

  final TimerSettingsHistoryRepository timerSettingsHistoryRepository;
  final CrashlyticsService crashlyticsService;

  TimerSettingsHistoryBloc({
    required this.timerSettingsHistoryRepository,
    required this.crashlyticsService,
  }) : super(const TimerSettingsHistoryState.initial()) {
    
    on<SaveTimerSettingsHistoryEvent>(_onSaveTimerSettingsHistory);
    on<LoadTimerSettingsHistoryEvent>(_onLoadTimerSettingsHistory);
  }

  void _onLoadTimerSettingsHistory(LoadTimerSettingsHistoryEvent event, emit) async {
    logger.t('Loading timer settings history...');
    emit(const TimerSettingsHistoryState.loading());

    try {
      List<TimerSettings> timerSettingsList =
      await timerSettingsHistoryRepository.query(
        event.profileId,
        const TimerSettingsHistoryQueryOptions(),
      );
      emit(TimerSettingsHistoryState.loaded(timerSettingsList: timerSettingsList));
    } catch (e, stack) {
      emit(const TimerSettingsHistoryState.error());
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to timer settings history: ${event.profileId}'
      );
      // event.onError?.call(exception, stackTrace);
    }
  }

  void _onSaveTimerSettingsHistory(SaveTimerSettingsHistoryEvent event, emit) {

  }

}
