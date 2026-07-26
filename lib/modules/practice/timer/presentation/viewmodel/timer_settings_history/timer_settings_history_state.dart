part of 'timer_settings_history_cubit.dart';

@freezed
class TimerSettingsHistoryState with _$TimerSettingsHistoryState {

  const factory TimerSettingsHistoryState.initial() =
    _Initial;

  const factory TimerSettingsHistoryState.loading() =
    TimerSettingsHistoryLoading;

  const factory TimerSettingsHistoryState.loaded({
    required List<TimerSettingsHistoryRecord> timerSettingsList,
  }) = TimerSettingsHistoryLoaded;

  const factory TimerSettingsHistoryState.error() =
    TimerSettingsHistoryError;

}
