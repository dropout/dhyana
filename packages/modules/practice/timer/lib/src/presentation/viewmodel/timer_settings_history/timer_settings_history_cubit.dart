import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:core/core.dart';
import 'package:timer/src/data/mapper/timer_settings_mapper.dart';
import 'package:timer/src/public/viewmodel/timer_settings_cubit.dart';
import 'package:timer/src/timer_module.dart';
import 'package:timer/src/domain/entity/timer_settings_history_record_entity.dart';
import 'package:timer/src/domain/repository/timer_settings_history_repository.dart';

part 'timer_settings_history_cubit.freezed.dart';

@freezed
class TimerSettingsHistoryState with _$TimerSettingsHistoryState {
  const factory TimerSettingsHistoryState.initial() = _Initial;

  const factory TimerSettingsHistoryState.loading() =
      TimerSettingsHistoryLoading;

  const factory TimerSettingsHistoryState.loaded({
    required List<TimerSettingsHistoryRecordEntity> timerSettingsList,
  }) = TimerSettingsHistoryLoaded;

  const factory TimerSettingsHistoryState.error() = TimerSettingsHistoryError;
}

/// Manages the state of the timer settings history feature.
class TimerSettingsHistoryCubit extends Cubit<TimerSettingsHistoryState>
    with LoggerMixin {
  final TimerSettingsHistoryRepository timerSettingsHistoryRepository;
  final CrashlyticsService crashlyticsService;
  final TimerSettingsCubit timerSettingsCubit;

  /// Creates a [TimerSettingsHistoryCubit] with the given dependencies.
  TimerSettingsHistoryCubit({
    required this.timerSettingsHistoryRepository,
    required this.crashlyticsService,
    required this.timerSettingsCubit,
  }) : super(const TimerSettingsHistoryState.initial());

  /// Loads the timer settings history for the given profile ID.
  Future<void> loadSettings(String profileId) async {
    try {
      emit(const TimerSettingsHistoryState.loading());
      List<TimerSettingsHistoryRecordEntity> timerSettingsList =
          await timerSettingsHistoryRepository.query(profileId, limit: 5);
      emit(
        TimerSettingsHistoryState.loaded(timerSettingsList: timerSettingsList),
      );
      logger.t(
        'Loaded ${timerSettingsList.length} timer settings from history',
      );
    } catch (e, stack) {
      emit(const TimerSettingsHistoryState.error());
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to load timer settings history record: $profileId',
      );
    }
  }

  /// Saves the given timer settings to the history for the given profile ID.
  Future<void> saveSettings(
    String profileId,
    TimerSettings timerSettings,
  ) async {
    try {
      await timerSettingsHistoryRepository.recordTimerSettingsHistory(
        profileId,
        timerSettings.toDomain(),
      );
      logger.t('Timer settings history record successfully saved.');
    } catch (e, stack) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason:
            'Unable to timer save timer settings to timer settings history!',
      );
    }
  }

  /// Saves the given settings to history and makes them current.
  Future<void> useSettings(
    String profileId,
    TimerSettings timerSettings,
  ) async {
    try {
      await timerSettingsHistoryRepository.recordTimerSettingsHistory(
        profileId,
        timerSettings.toDomain(),
      );
      await timerSettingsCubit.timerSettingsChanged(timerSettings);
      logger.t('Selected timer settings are in use.');
    } catch (e, stack) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to set given timer settings in use!',
      );
    }
  }
}
