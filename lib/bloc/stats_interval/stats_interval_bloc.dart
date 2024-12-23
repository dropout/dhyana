import 'package:bloc/bloc.dart';
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

  StatsIntervalBloc() : super(StatsIntervalState.loaded(
    statsInterval: StatsInterval(
      intervalType: StatsIntervalType.days,
      from: DateTime.now().subtract(Duration(days: StatsIntervalType.days.intervalInDays)),
      to: DateTime.now()
    )
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
