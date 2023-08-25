import 'package:dhyana/model/day.dart';

abstract interface class DayRepository {

  Future<List<Day>> getDays({
    required String profileId,
    required DateTime from,
    required DateTime to,
  });

}
