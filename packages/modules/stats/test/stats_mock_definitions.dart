import 'package:mocktail/mocktail.dart';

import 'package:profile/profile.dart';
import 'package:stats/src/data/datasource/day_details_data_provider.dart';
import 'package:stats/src/data/datasource/firebase_stats_data_provider_factory.dart';
import 'package:stats/src/data/datasource/stats_bucket_data_provider.dart';
import 'package:stats/src/domain/repository/stats_repository.dart';
import 'package:stats/src/public/api/stats_public_api.dart';


class MockStatsDataProviderFactory 
  extends Mock
  implements FirebaseStatsDataProviderFactory {}

class MockStatsBucketDataProvider 
  extends Mock
  implements StatsBucketDataProvider {}

class MockDayDetailsDataProvider 
  extends Mock 
  implements DayDetailsDataProvider {}
  
class MockStatisticsRepository 
  extends Mock
  implements StatsRepository {}

class MockStatsPublicApi 
  extends Mock
  implements StatsPublicApi {}

class MockProfilePublicApi 
  extends Mock
  implements ProfilePublicApi {}
