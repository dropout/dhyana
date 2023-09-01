import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/service/all.dart';
import 'package:dhyana/util/all.dart';

part 'timer_settings_event.dart';
part 'timer_settings_state.dart';
part 'timer_settings_bloc.freezed.dart';

class TimerSettingsBloc extends Bloc<TimerSettingsEvent, TimerSettingsState> {

  Logger logger = getLogger('TimerSettingsBloc');

  CrashlyticsService crashlyticsService;
  TimerSettingsSharedPrefsService timerSettingsSharedPrefsService;

  TimerSettingsBloc({
    required this.crashlyticsService,
    required this.timerSettingsSharedPrefsService,
  }) : super(const TimerSettingsState.loading()) {
    on<LoadTimerSettingsData>(_onLoadTimerSettingsData);
    on<TimerSettingsChanged>(_onTimerSettingsChanged);
  }

  void _onLoadTimerSettingsData(LoadTimerSettingsData event, emit) async {
    try {
      if (event.timerSettings != null) {
        logger.v('Using timer settings from event...');
        emit(TimerSettingsState.loaded(
          timerSettings: event.timerSettings!,
        ));
      } else {
        emit(const TimerSettingsState.loading());
        logger.v('Loading timer settings data...');
        TimerSettings timerSettings =
          await timerSettingsSharedPrefsService.getTimerSettings();
        logger.v('Loaded timer setting from shared prefs...');
        emit(TimerSettingsState.loaded(
          timerSettings: timerSettings,
        ));
      }
      logger.v('Loaded timer settings data!');
    } catch (e, stack) {
      emit(const TimerSettingsState.error());
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
      emit(TimerSettingsState.loaded(timerSettings: event.timerSettings));
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
