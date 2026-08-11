import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/modules/stats/data/datasource/day_details_data_provider.dart';
import 'package:dhyana/modules/stats/data/datasource/firebase_day_details_data_provider.dart';
import 'package:dhyana/modules/stats/data/datasource/firebase_stats_bucket_data_provider.dart';
import 'package:dhyana/modules/stats/data/datasource/stats_bucket_data_provider.dart';
import 'package:dhyana/modules/stats/domain/enum/stats_entity_granularity.dart';

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
