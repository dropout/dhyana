import 'package:firebase_provider/firebase_provider.dart';
import 'package:stats/src/data/datasource/day_details_data_provider.dart';
import 'package:stats/src/data/datasource/firebase_day_details_data_provider.dart';
import 'package:stats/src/data/datasource/firebase_stats_bucket_data_provider.dart';
import 'package:stats/src/data/datasource/stats_bucket_data_provider.dart';
import 'package:stats/src/domain/enum/stats_entity_granularity.dart';

class FirebaseStatsDataProviderFactory {
  final FirebaseFirestore fireStore;

  FirebaseStatsDataProviderFactory({required this.fireStore});

  StatsBucketDataProvider createStatsBucketDataProvider(
    String profileId,
    StatsEntityGranularity granularity,
  ) => switch (granularity) {
    .days => FirebaseStatsBucketDataProvider(fireStore: fireStore, bucketName: granularity.name, profileId: profileId),
    .weeks => FirebaseStatsBucketDataProvider(fireStore: fireStore, bucketName: granularity.name, profileId: profileId),
    .months => FirebaseStatsBucketDataProvider(fireStore: fireStore, bucketName: granularity.name, profileId: profileId),
    .years => FirebaseStatsBucketDataProvider(fireStore: fireStore, bucketName: granularity.name, profileId: profileId),
  };

  DayDetailsDataProvider createDayDetailsDataProvider(String profileId) =>
    FirebaseDayDetailsDataProvider(fireStore: fireStore, profileId: profileId);
}
