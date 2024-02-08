import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/model/day.dart';
import 'package:dhyana/repository/day_repository.dart';
import 'package:dhyana/service/crashlytics_service.dart';
import 'package:dhyana/util/logger_factory.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'days_event.dart';
part 'days_state.dart';
part 'days_bloc.freezed.dart';

class DaysBloc extends Bloc<DaysEvent, DaysState> {

  Logger logger = getLogger('DaysBloc');

  final DayRepository dayRepository;
  final CrashlyticsService crashlyticsService;

  StreamSubscription<List<Day>>? _streamSubscription;

  DaysBloc({
    required this.dayRepository,
    required this.crashlyticsService,
  }) : super(const DaysState.loading()) {
    on<GetDaysEvent>(_onGetDaysEvent);
    on<ReceiveUpdateDaysEvent>(_onReceiveUpdate);
  }

  void _onGetDaysEvent(GetDaysEvent event, emit) async {
    try {
      logger.t('Loading days: ${event.from} ... ${event.to}');
      emit(const DaysState.loading());

      if (event.useStream) {
        logger.t('Streaming days');
        _streamSubscription?.cancel();

        _streamSubscription = dayRepository.getDaysStream(
          profileId: event.profileId,
          from: event.from,
          to: event.to ?? DateTime.now()
        ).listen((daysList) {
          add(DaysEvent.receiveUpdate(days: daysList));
        });

        _streamSubscription?.onError((exception, stackTrace) {
          crashlyticsService.recordError(
            exception: exception,
            stackTrace: stackTrace,
            reason: 'Error occured when receiving profile info: ${event.profileId}'
          );

          // Maybe we don't need to display this error?
          add(const DaysEvent.error());
        });
      } else {
        List<Day> days = await dayRepository.getDays(
          profileId: event.profileId,
          from: event.from,
          to: event.to ?? DateTime.now(),
        );
        emit(DaysState.loaded(days: days));
        logger.t('Successfully loaded days ${days.length}');
      }
    } catch (e, stack) {
      logger.t('Failed to get days');
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to add session'
      );
    }
  }

  void _onReceiveUpdate(ReceiveUpdateDaysEvent event, emit) {
    logger.t('Receiving days update');
    emit(DaysState.loaded(days: event.days));
  }

  @override
  Future<void> close() async {
    _streamSubscription?.cancel();
    return super.close();
  }

}
