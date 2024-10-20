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

class YearBloc extends Bloc<YearsEvent, YearsState> {

  final Logger logger = getLogger('YearBloc');

  final StatisticsRepository statisticsRepository;
  final CrashlyticsService crashlyticsService;

  YearBloc({
    required this.statisticsRepository,
    required this.crashlyticsService,
  }) : super(const YearsState.loading()) {
    on<GetYearsEvent>(_onGetYearEvent);
  }

  void _onGetYearEvent(GetYearsEvent event, emit) async {
    try {
      logger.t('Loading years: ${event.from.toString()} ... ${event.to.toString()}');
      emit(const YearsState.loading());
      List<Year> years = await statisticsRepository.queryYears(
        event.profileId,
        YearQueryOptions(
          from: event.from,
          to: event.to ?? DateTime.now()
        ),
      );

      emit(YearsState.loaded(years: years));
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
}
