import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/data_provider/all.dart';
import 'package:dhyana/model/all.dart';
import 'package:dhyana/repository/day_repository.dart';
import 'package:dhyana/util/date_time_utils.dart';
import 'package:dhyana/util/logger_factory.dart';
import 'package:logger/logger.dart';


class FirebaseDayRepository implements DayRepository {

  Logger logger = getLogger('FirebaseDayRepository');
  final FirebaseFirestore fireStore;

  FirebaseDayRepository({
    required this.fireStore,
  });

  @override
  Future<List<Day>> queryDays({
    required String profileId,
    required DayQueryOptions queryOptions,
  }) async {
    DayDataProvider dayDataProvider = FirebaseDayDataProvider(
      fireStore,
      profileId
    );

    Duration diff = queryOptions.to.difference(queryOptions.from);
    int daysCount = diff.inDays.abs();

    logger.t('Querying $daysCount window');

    List<Day> qDays = await dayDataProvider.query(queryOptions);

    logger.t('Got ${qDays.length} from database');

    final DateTime from = queryOptions.from;
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
  Stream<List<Day>> queryDaysStream({
    required String profileId,
    required DayQueryOptions queryOptions,
  }) {
    DayDataProvider dayDataProvider = FirebaseDayDataProvider(
      fireStore,
      profileId
    );

    Duration diff = queryOptions.to.difference(queryOptions.from);
    int daysCount = diff.inDays.abs();

    logger.t('Streaming $daysCount window');

    Stream<List<Day>> daysStream = dayDataProvider.queryStream(queryOptions);

    final DateTime from = queryOptions.from;
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
