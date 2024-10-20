import 'package:dhyana/model/all.dart';
import 'package:dhyana/util/all.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/repository/statistics_repository.dart';
import 'package:dhyana/service/crashlytics_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'months_event.dart';
part 'months_state.dart';
part 'months_bloc.freezed.dart';

class MonthBloc extends Bloc<MonthEvent, MonthState> {

  final Logger logger = getLogger('MonthBloc');

  final StatisticsRepository statisticsRepository;
  final CrashlyticsService crashlyticsService;

  MonthBloc({
    required this.statisticsRepository,
    required this.crashlyticsService,
  }) : super(const MonthState.loading()) {
    on<GetMonthEvent>(_onGetMonthEvent);
  }

  void _onGetMonthEvent(GetMonthEvent event, emit) async {
    try {
      logger.t('Loading months: ${event.from} ... ${event.to}');
      emit(const MonthState.loading());
      MonthQueryOptions queryOptions = MonthQueryOptions(
          from: event.from,
          to: event.to ?? DateTime.now()
      );
      List<Month> months = await statisticsRepository.queryMonths(
        event.profileId,
        queryOptions,
      );

      emit(MonthState.loaded(months: _fillEmptyMonths(months, queryOptions)));
      logger.t('Successfully loaded months ${months.length}');

    } catch (e, stack) {
      logger.t('Failed to get months');
      crashlyticsService.recordError(
          exception: e,
          stackTrace: stack,
          reason: 'Unable to add session'
      );
    }
  }

  List<Month> _fillEmptyMonths(List<Month> months, MonthQueryOptions queryOptions) {

    Duration diff = queryOptions.to.difference(queryOptions.from);
    int monthsCount = (diff.inDays / 30).ceil();

    logger.t('Querying $monthsCount window');
    logger.t('Got ${months.length} from database');

    final DateTime from = queryOptions.from;

    List<Month> result = [];
    for (var i = 0; i < monthsCount; ++i) {
      String monthId = DateTime(from.year, from.month + i).toMonthId();
      Month m = months.firstWhere((m) => m.id == monthId, orElse: () => Month(
        id: DateTime(from.year, from.month + i).toMonthId(),
        date: DateTime(from.year, from.month + i),
        sessionCount: 0,
        minutes: 0,
      ));
      result.add(m);
    }
    return result;
  }
}
