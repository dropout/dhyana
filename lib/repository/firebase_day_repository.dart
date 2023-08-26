import 'package:dhyana/data_provider/day_data_provider.dart';
import 'package:dhyana/model/day.dart';
import 'package:dhyana/util/date_time.dart';
import 'package:dhyana/util/logger_factory.dart';
import 'package:logger/logger.dart';

import 'day_repository.dart';

class FirebaseDayRepository implements DayRepository {

  Logger logger = getLogger('FirebaseDayRepository');
  final DayDataProvider dayDataProvider;

  FirebaseDayRepository({
    required this.dayDataProvider,
  });

  @override
  Future<List<Day>> getDays({
    required String profileId,
    required DateTime from,
    required DateTime to,
    bool useStream = false,
  }) async {

    Duration diff = to.difference(from);
    int daysCount = diff.inDays.abs();

    logger.v('Querying $daysCount window');

    List<Day> qDays = await dayDataProvider.getDays(
      profileId,
      from,
      to,
    );

    logger.v('Got ${qDays.length} from database');

    List<Day> result = [];
    for (var i = 0; i < daysCount; ++i) {
      String dayId = DateTime(from.year, from.month, from.day + i).toDayId();
      Day d = qDays.firstWhere((d) => d.id == dayId, orElse: () => Day.empty(
        day: DateTime(from.year, from.month, from.day + i),
      ));
      result.add(d);
    }

    return result;
  }

  @override
  Stream<List<Day>> getDaysStream({
    required String profileId,
    required DateTime from,
    required DateTime to,
    bool useStream = false,
  }) {

    Duration diff = to.difference(from);
    int daysCount = diff.inDays.abs();

    logger.v('Streaming $daysCount window');

    Stream<List<Day>> daysStream = dayDataProvider.getDaysStream(
      profileId,
      from,
      to
    );

    return daysStream.map((daysList) {
      List<Day> result = [];
      for (var i = 0; i < daysCount; ++i) {
        String dayId = DateTime(from.year, from.month, from.day + i).toDayId();
        Day d = daysList.firstWhere((d) => d.id == dayId, orElse: () => Day.empty(
          day: DateTime(from.year, from.month, from.day + i),
        ));
        result.add(d);
      }
      return result;
    });
  }

}
