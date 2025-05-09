import 'package:dhyana/model/timer_settings_history_record.dart';
import 'package:dhyana/model/timer_settings_history_record_query_options.dart';
import 'package:dhyana/util/logger_factory.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/repository/timer_settings_history_repository.dart';
import 'package:dhyana/service/crashlytics_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'timer_settings_history_event.dart';
part 'timer_settings_history_state.dart';
part 'timer_settings_history_bloc.freezed.dart';

class TimerSettingsHistoryBloc
    extends Bloc<TimerSettingsHistoryEvent, TimerSettingsHistoryState> {

  final Logger logger = getLogger('TimerSettingsHistoryBloc');

  final TimerSettingsHistoryRepository timerSettingsHistoryRepository;
  final CrashlyticsService crashlyticsService;

  TimerSettingsHistoryBloc({
    required this.timerSettingsHistoryRepository,
    required this.crashlyticsService,
  }) : super(const TimerSettingsHistoryState.initial()) {
    on<SaveTimerSettingsHistoryEvent>(_onSaveTimerSettingsHistory);
    on<LoadTimerSettingsHistoryEvent>(_onLoadTimerSettingsHistory);
  }

  void _onLoadTimerSettingsHistory(LoadTimerSettingsHistoryEvent event, emit) async {
    try {
      emit(const TimerSettingsHistoryState.loading());
      List<TimerSettingsHistoryRecord> timerSettingsList =
      await timerSettingsHistoryRepository.query(
        event.profileId,
        const TimerSettingsHistoryRecordQueryOptions(limit: 5),
      );
      emit(TimerSettingsHistoryState.loaded(timerSettingsList: timerSettingsList));
      logger.t('Loaded ${timerSettingsList.length} timer settings from history');
    } catch (e, stack) {
      emit(const TimerSettingsHistoryState.error());
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to load timer settings history record: ${event.profileId}'
      );
    }
  }

  void _onSaveTimerSettingsHistory(SaveTimerSettingsHistoryEvent event, emit) async {
    try {
      await timerSettingsHistoryRepository.recordTimerSettingsHistory(
        event.profileId,
        event.timerSettings,
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
