import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/service/crashlytics_service.dart';
import 'package:dhyana/service/timer_settings_shared_prefs_service.dart';
import 'package:dhyana/util/logger_mixin.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'timer_settings_state.dart';
part 'timer_settings_cubit.freezed.dart';

class TimerSettingsCubit extends Cubit<TimerSettingsState> with LoggerMixin {

  TimerSettingsSharedPrefsService timerSettingsSharedPrefsService;
  CrashlyticsService crashlyticsService;

  TimerSettingsCubit({
    required this.timerSettingsSharedPrefsService,
    required this.crashlyticsService,
  }) : super(const TimerSettingsState.loading());

  Future<void> loadTimerSettings({TimerSettings? timerSettings}) async {
    try {
      if (timerSettings != null) {
        emit(TimerSettingsState.loaded(
          timerSettings: timerSettings,
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

  Future<void> timerSettingsChanged(TimerSettings timerSettings) async {
    try {
      // Emit the new timer settings to the state
      emit(TimerSettingsState.loaded(timerSettings: timerSettings));

      // Lazy save the new timer settings to shared preferences
      timerSettingsSharedPrefsService.setTimerSettings(timerSettings);

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
