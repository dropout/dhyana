import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/service/all.dart';
import 'package:dhyana/util/all.dart';

part 'timer_settings_event.dart';
part 'timer_settings_state.dart';

class TimerSettingsBloc extends Bloc<TimerSettingsEvent, TimerSettingsState> {

  Logger logger = getLogger('TimerSettingsBloc');

  CrashlyticsService crashlyticsService;
  TimerSettingsSharedPrefsService timerSettingsSharedPrefsService;

  TimerSettingsBloc({
    required this.crashlyticsService,
    required this.timerSettingsSharedPrefsService,
  }) : super(const TimerSettingsInitial()) {
    on<LoadTimerSettingsData>(_onLoadTimerSettingsData);
    on<TimerSettingsChanged>(_onTimerSettingsChanged);
  }

  void _onLoadTimerSettingsData(LoadTimerSettingsData event, emit) async {
    try {
      if (event.timerSettings != null) {
        logger.v('Using timer settings from event...');
        emit(TimerSettingsDataLoadedState(
          timerSettings: event.timerSettings!,
        ));
      } else {
        emit(const TimerSettingsDataLoadingState());
        logger.v('Loading timer settings data...');
        TimerSettings timerSettings =
        await timerSettingsSharedPrefsService.getTimerSettings();
        logger.v('Loaded timer setting from shared prefs...');
        emit(TimerSettingsDataLoadedState(
          timerSettings: timerSettings,
        ));
      }
      logger.v('Loaded timer settings data!');
    } catch (e, stack) {
      emit(const TimerSettingsDataErrorState());
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to load timer settings'
      );
    }

  }

  void _onTimerSettingsChanged(TimerSettingsChanged event, emit) async {
    try {
      await timerSettingsSharedPrefsService.setTimerSettings(event.timerSettings);
      emit(
        TimerSettingsDataLoadedState(
          timerSettings: event.timerSettings,
        )
      );
      logger.v('Timer settings changed...');
    } catch (e, stack) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to save timer settings to sharedprefs when change occured'
      );
    }
  }

}
