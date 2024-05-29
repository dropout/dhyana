part of 'timer_settings_history_bloc.dart';

@freezed
class TimerSettingsHistoryEvent with _$TimerSettingsHistoryEvent {

  const factory TimerSettingsHistoryEvent.started() = _Started;

  const factory TimerSettingsHistoryEvent.saveSettings({
    required TimerSettings timerSettings,
  }) = SaveTimerSettingsHistoryEvent;

  const factory TimerSettingsHistoryEvent.loadSettingsList({
    required String profileId,
  }) = LoadTimerSettingsHistoryEvent;

}
