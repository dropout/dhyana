import 'package:dhyana/modules/practice/timer/domain/model/timer_settings.dart';
import 'package:dhyana/core/domain/service/crashlytics_service.dart';
import 'package:dhyana/util/logger_mixin.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'timer_settings_state.dart';
part 'timer_settings_cubit.freezed.dart';

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
