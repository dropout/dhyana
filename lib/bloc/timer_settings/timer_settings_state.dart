part of 'timer_settings_bloc.dart';

@freezed
sealed class TimerSettingsState with _$TimerSettingsState {

  const TimerSettingsState._();

  const factory TimerSettingsState.loading() = TimerSettingsDataLoadingState;
  const factory TimerSettingsState.loaded({
    required TimerSettings timerSettings,
  }) = TimerSettingsDataLoadedState;

  const factory TimerSettingsState.error() = TimerSettingsDataErrorState;

}
