import 'package:dhyana/model/day.dart';
import 'package:dhyana/model/day_query_options.dart';

abstract interface class DayRepository {

  Future<List<Day>> query({
    required String profileId,
    required DayQueryOptions queryOptions,
  });

  Stream<List<Day>> queryStream({
    required String profileId,
    required DayQueryOptions queryOptions,
  });

}
