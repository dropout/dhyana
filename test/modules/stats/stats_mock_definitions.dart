import 'package:mocktail/mocktail.dart';

import 'package:dhyana/modules/stats/data/datasource/day_details_data_provider.dart';
import 'package:dhyana/modules/stats/data/datasource/firebase_stats_data_provider_factory.dart';
import 'package:dhyana/modules/stats/data/datasource/stats_bucket_data_provider.dart';


class MockStatsDataProviderFactory 
  extends Mock
  implements FirebaseStatsDataProviderFactory {}

class MockStatsBucketDataProvider 
  extends Mock
  implements StatsBucketDataProvider {}

class MockDayDetailsDataProvider 
  extends Mock 
  implements DayDetailsDataProvider {}
  