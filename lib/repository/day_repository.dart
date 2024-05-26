import 'package:dhyana/model/day.dart';
import 'package:dhyana/model/day_query_options.dart';

abstract interface class DayRepository {

  Future<List<Day>> queryDays({
    required String profileId,
    required DayQueryOptions queryOptions,
  });

  Stream<List<Day>> queryDaysStream({
    required String profileId,
    required DayQueryOptions queryOptions,
  });

}
