import 'package:dhyana/model/all.dart';
import 'package:dhyana/util/all.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/repository/statistics_repository.dart';
import 'package:dhyana/service/crashlytics_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'years_event.dart';
part 'years_state.dart';
part 'years_bloc.freezed.dart';

class YearsBloc extends Bloc<YearsEvent, YearsState> {

  final Logger logger = getLogger('YearBloc');

  final StatisticsRepository statisticsRepository;
  final CrashlyticsService crashlyticsService;

  YearsBloc({
    required this.statisticsRepository,
    required this.crashlyticsService,
  }) : super(const YearsState.loading()) {
    on<QueryYearsEvent>(_onQueryYearsEvent);
  }

  void _onQueryYearsEvent(QueryYearsEvent event, emit) async {
    try {
      logger.t('Loading years: ${event.from.toString()} ... ${event.to.toString()}');
      emit(const YearsState.loading());

      YearQueryOptions queryOptions = YearQueryOptions(
        from: event.from,
        to: event.to ?? DateTime.now()
      );

      List<Year> years = await statisticsRepository.queryYears(
        event.profileId,
        queryOptions,
      );

      emit(YearsState.loaded(years: _fillEmptyYears(years, queryOptions)));
      logger.t('Successfully loaded years count: ${years.length}');
    } catch (e, stack) {
      logger.t('Failed to get year');
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to load years data'
      );
    }
  }

  List<Year> _fillEmptyYears(List<Year> years, YearQueryOptions queryOptions) {
    int yearsCount = queryOptions.to.year - queryOptions.from.year;

    logger.t('Querying $yearsCount window');
    logger.t('Got ${years.length} from database');

    final DateTime from = queryOptions.from;

    List<Year> result = [];
    for (int i = 0; i < yearsCount; i++) {
      String yearId = DateTime(from.year + i, 1, 1).toYearId();
      Year y = years.firstWhere(
        (year) => year.id == yearId,
        orElse: () => Year(
          startDate: DateTime(from.year + i, 1, 1),
          id: yearId,
          minutesCount: 0,
          sessionCount: 0,
        ),
      );
      result.add(y);
    }

    return years;
  }

}
