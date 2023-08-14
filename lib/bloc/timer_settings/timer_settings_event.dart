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

// abstract class TimerSettingsEvent extends Equatable {
//   const TimerSettingsEvent();
// }
//
// class LoadTimerSettingsData extends TimerSettingsEvent {
//   final TimerSettings? timerSettings;
//   const LoadTimerSettingsData({
//     this.timerSettings
//   });
//   @override
//   List<Object?> get props => [timerSettings];
// }
//
// class TimerSettingsChanged extends TimerSettingsEvent {
//   final TimerSettings timerSettings;
//   const TimerSettingsChanged({
//     required this.timerSettings,
//   });
//   @override
//   List<Object> get props => [timerSettings];
// }
