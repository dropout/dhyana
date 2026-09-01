import 'package:timer/src/timer_module.dart';
import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'timer_settings_cubit.freezed.dart';

@freezed
sealed class TimerSettingsState with _$TimerSettingsState {

  const TimerSettingsState._();

  const factory TimerSettingsState({
    required TimerSettings timerSettings,
  }) = _TimerSettingsState;

}


class TimerSettingsCubit extends HydratedCubit<TimerSettingsState>
    with LoggerMixin {
  CrashlyticsService crashlyticsService;

  TimerSettingsCubit({
    required this.crashlyticsService,
  }) : super(TimerSettingsState(timerSettings: TimerSettings()));

  @override
  TimerSettingsState fromJson(Map<String, dynamic> json) {
    try {
      final timerSettings = TimerSettings.fromJson(json);
      return state.copyWith(timerSettings: timerSettings);
    } catch (e, stack) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Failed to deserialize TimerSettings from JSON',
      );
      return state;
    }
  }

  @override
  Map<String, dynamic> toJson(TimerSettingsState state) {
    try {
      return state.timerSettings.toJson();
    } catch (e, stack) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Failed to serialize TimerSettings to JSON',
      );
      return {};
    }
  }

  Future<void> timerSettingsChanged(TimerSettings timerSettings) async {
    try {
      emit(state.copyWith(timerSettings: timerSettings));
      logger.t('Timer settings changed');
    } catch (e, stack) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason:
          'Unable to propagate timer settings change to state. TimerSettings: $timerSettings',
      );
    }
  }
}
