import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/repository/timer_settings_history_repository.dart';
import 'package:dhyana/service/crashlytics_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'timer_settings_history_event.dart';
part 'timer_settings_history_state.dart';
part 'timer_settings_history_bloc.freezed.dart';

class TimerSettingsHistoryBloc
    extends Bloc<TimerSettingsHistoryEvent, TimerSettingsHistoryState> {

  final TimerSettingsHistoryRepository timerSettingsHistoryRepository;
  final CrashlyticsService crashlyticsService;

  TimerSettingsHistoryBloc({
    required this.timerSettingsHistoryRepository,
    required this.crashlyticsService,
  }) : super(const TimerSettingsHistoryState.initial()) {


    on<TimerSettingsHistoryEvent>((event, emit) {
      // TODO: implement event handler
    });


  }
}
