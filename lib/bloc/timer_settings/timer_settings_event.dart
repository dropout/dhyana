part of 'timer_settings_bloc.dart';

@freezed
sealed class TimerSettingsEvent with _$TimerSettingsEvent {

  const TimerSettingsEvent._();

  const factory TimerSettingsEvent.load({
    TimerSettings? timerSettings,
  }) = LoadTimerSettingsData;
  const factory TimerSettingsEvent.changed({
    required TimerSettings timerSettings,
  }) = TimerSettingsChanged;

}
