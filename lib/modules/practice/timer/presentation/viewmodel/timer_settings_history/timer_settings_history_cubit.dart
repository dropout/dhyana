import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/modules/practice/timer/data/mapper/timer_settings_mapper.dart';
import 'package:dhyana/modules/practice/timer/timer_module.dart';
import 'package:dhyana/modules/practice/timer/domain/entity/timer_settings_history_record_entity.dart';
import 'package:dhyana/modules/practice/timer/domain/repository/timer_settings_history_repository.dart';
import 'package:dhyana/core/service/crashlytics_service.dart';
import 'package:dhyana/core/util/logger_mixin.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'timer_settings_history_cubit.freezed.dart';

@freezed
class TimerSettingsHistoryState with _$TimerSettingsHistoryState {

  const factory TimerSettingsHistoryState.initial() =
    _Initial;

  const factory TimerSettingsHistoryState.loading() =
    TimerSettingsHistoryLoading;

  const factory TimerSettingsHistoryState.loaded({
    required List<TimerSettingsHistoryRecordEntity> timerSettingsList,
  }) = TimerSettingsHistoryLoaded;

  const factory TimerSettingsHistoryState.error() =
    TimerSettingsHistoryError;

}

/// Manages the state of the timer settings history feature.
class TimerSettingsHistoryCubit
  extends Cubit<TimerSettingsHistoryState>
  with LoggerMixin {

  final TimerSettingsHistoryRepository timerSettingsHistoryRepository;
  final CrashlyticsService crashlyticsService;

  /// Creates a [TimerSettingsHistoryCubit] with the given dependencies.
  TimerSettingsHistoryCubit({
    required this.timerSettingsHistoryRepository,
    required this.crashlyticsService,
  }) : super(const TimerSettingsHistoryState.initial());

  /// Loads the timer settings history for the given profile ID.
  Future<void> loadSettings(String profileId) async {
    try {
      emit(const TimerSettingsHistoryState.loading());
      List<TimerSettingsHistoryRecordEntity> timerSettingsList =
      await timerSettingsHistoryRepository.query(
        profileId,
        limit: 5,
      );
      emit(TimerSettingsHistoryState.loaded(timerSettingsList: timerSettingsList));
      logger.t('Loaded ${timerSettingsList.length} timer settings from history');
    } catch (e, stack) {
      emit(const TimerSettingsHistoryState.error());
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to load timer settings history record: $profileId'
      );
    }
  }

  /// Saves the given timer settings to the history for the given profile ID.
  Future<void> saveSettings(String profileId, TimerSettings timerSettings) async {
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
        reason: 'Unable to timer save timer settings to timer settings history!'
      );
    }
  }

  /// Saves the given timer settings to the history for the given profile ID 
  /// and sets it as the current timer settings in shared preferences so 
  /// that it can be read from shared preferences on the home screen.
  Future<void> useSettings(String profileId, TimerSettings timerSettings) async {
    try {      
      await timerSettingsHistoryRepository.recordTimerSettingsHistory(
        profileId,
        timerSettings.toDomain(),
      );      
      logger.t('Selected timer settings are in use.');
    } catch (e, stack) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to set given timer settings in use!'
      );
    }
  }


}
