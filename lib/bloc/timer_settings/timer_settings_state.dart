part of 'timer_settings_bloc.dart';

@freezed
sealed class TimerSettingsState with _$TimerSettingsState {

  const TimerSettingsState._();

  const factory TimerSettingsState.initial() = TimerSettingsInitial;
  const factory TimerSettingsState.loading() = TimerSettingsDataLoadingState;
  const factory TimerSettingsState.loaded({
    required TimerSettings timerSettings,
  }) = TimerSettingsDataLoadedState;

  const factory TimerSettingsState.error() = TimerSettingsDataErrorState;

}

//
// abstract class TimerSettingsState extends Equatable {
//   const TimerSettingsState();
// }
//
// class TimerSettingsInitial extends TimerSettingsState {
//   const TimerSettingsInitial();
//   @override
//   List<Object> get props => [];
// }
//
// class TimerSettingsDataLoadingState extends TimerSettingsState {
//   const TimerSettingsDataLoadingState();
//   @override
//   List<Object> get props => [];
// }
//
// class TimerSettingsDataLoadedState extends TimerSettingsState {
//
//   final TimerSettings timerSettings;
//
//   const TimerSettingsDataLoadedState({
//     required this.timerSettings,
//   });
//
//   @override
//   List<Object> get props => [timerSettings];
//
// }
//
// class TimerSettingsDataErrorState extends TimerSettingsState {
//   const TimerSettingsDataErrorState();
//
//   @override
//   List<Object> get props => [];
// }
