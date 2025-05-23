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

  final Logger logger = getLogger('TimerSettingsBloc');

  TimerSettingsSharedPrefsService timerSettingsSharedPrefsService;
  CrashlyticsService crashlyticsService;

  TimerSettingsBloc({
    required this.timerSettingsSharedPrefsService,
    required this.crashlyticsService,
  }) : super(const TimerSettingsState.loading()) {
    on<LoadTimerSettingsData>(_onLoadTimerSettingsData);
    on<TimerSettingsChanged>(_onTimerSettingsChanged);
  }

  void _onLoadTimerSettingsData(LoadTimerSettingsData event, emit) async {
    try {
      if (event.timerSettings != null) {
        emit(TimerSettingsState.loaded(
          timerSettings: event.timerSettings!,
        ));
        logger.t('Using timer settings from event');
      } else {
        emit(TimerSettingsState.loaded(
          timerSettings: timerSettingsSharedPrefsService.getTimerSettings(),
        ));
        logger.t('Loaded timer setting from shared preferences');
      }
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
      // Emit the new timer settings to the state
      emit(TimerSettingsState.loaded(timerSettings: event.timerSettings));

      // Lazy save the new timer settings to shared preferences
      timerSettingsSharedPrefsService.setTimerSettings(
        event.timerSettings
      );

      logger.t('Timer settings changed');
    } catch (e, stack) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to save timer settings to sharedprefs when change occured'
      );
    }
  }

}
