import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/model/year.dart';
import 'package:dhyana/model/year_query_options.dart';
import 'package:dhyana/repository/statistics_repository.dart';
import 'package:dhyana/service/crashlytics_service.dart';
import 'package:dhyana/util/date_time_utils.dart';
import 'package:dhyana/util/logger_mixin.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'years_state.dart';
part 'years_cubit.freezed.dart';

class YearsCubit extends Cubit<YearsState> with LoggerMixin {

  final StatisticsRepository statisticsRepository;
  final CrashlyticsService crashlyticsService;

  YearsCubit({
    required this.statisticsRepository,
    required this.crashlyticsService,
  }) : super(const YearsState.loading());

  Future<void> queryYears(String profileId, DateTime from, {DateTime? to}) async {
    try {
      emit(const YearsState.loading());

      YearQueryOptions queryOptions = YearQueryOptions(
        from: from,
        to: to ?? DateTime.now()
      );

      List<Year> years = await statisticsRepository.queryYears(
        profileId,
        queryOptions,
      );

      emit(YearsState.loaded(years: _fillEmptyYears(years, queryOptions)));
    } catch (e, stack) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to load years data'
      );
      emit(const YearsState.error());
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
