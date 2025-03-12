import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/enum/all.dart';
import 'package:dhyana/model/stats_interval.dart';
import 'package:dhyana/util/logger_factory.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'stats_interval_event.dart';
part 'stats_interval_state.dart';
part 'stats_interval_bloc.freezed.dart';

class StatsIntervalBloc extends Bloc<StatsIntervalEvent, StatsIntervalState> {

  final Logger logger = getLogger('StatsIntervalBloc');

  StatsIntervalBloc(
    StatsIntervalState initialState,
  ) : super(StatsIntervalState.loaded(
    statsInterval: initialState.statsInterval,
  )) {
    on<StatsIntervalChangedEvent>(_onStatsIntervalChanged);
  }

  void _onStatsIntervalChanged(StatsIntervalChangedEvent event, emit) {
    emit(StatsIntervalState.loaded(
      statsInterval: event.statsInterval,
    ));
    logger.t('Stats interval changed: ${event.statsInterval}');
  }

}
