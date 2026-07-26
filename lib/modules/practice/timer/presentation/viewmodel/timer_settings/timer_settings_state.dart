part of 'timer_settings_cubit.dart';

@freezed
sealed class TimerSettingsState with _$TimerSettingsState {

  const TimerSettingsState._();

  const factory TimerSettingsState({
    required TimerSettings timerSettings,
  }) = _TimerSettingsState;

}
