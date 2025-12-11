import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/model/timer_settings_history_record.dart';
import 'package:dhyana/model/timer_settings_history_record_query_options.dart';
import 'package:dhyana/repository/timer_settings_history_repository.dart';
import 'package:dhyana/service/crashlytics_service.dart';
import 'package:dhyana/util/logger_mixin.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'timer_settings_history_state.dart';
part 'timer_settings_history_cubit.freezed.dart';

class TimerSettingsHistoryCubit
  extends Cubit<TimerSettingsHistoryState>
  with LoggerMixin {

  final TimerSettingsHistoryRepository timerSettingsHistoryRepository;
  final CrashlyticsService crashlyticsService;

  TimerSettingsHistoryCubit({
    required this.timerSettingsHistoryRepository,
    required this.crashlyticsService,
  }) : super(const TimerSettingsHistoryState.initial());

  Future<void> loadSettings(String profileId) async {
    try {
      emit(const TimerSettingsHistoryState.loading());
      List<TimerSettingsHistoryRecord> timerSettingsList =
      await timerSettingsHistoryRepository.query(
        profileId,
        const TimerSettingsHistoryRecordQueryOptions(limit: 5),
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

  Future<void> saveSettings(String profileId, TimerSettings timerSettings) async {
    try {
      await timerSettingsHistoryRepository.recordTimerSettingsHistory(
        profileId,
        timerSettings,
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


}
