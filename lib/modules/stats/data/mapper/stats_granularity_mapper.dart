import 'package:dhyana/modules/stats/domain/enum/stats_entity_granularity.dart';
import 'package:dhyana/modules/stats/public/enum/stats_granularity.dart';

extension StatsGranularityMapper on StatsEntityGranularity {
  StatsGranularity toApi() => switch (this) {
    .day => .day,
    .week => .week,
    .month => .month,
    .year => .year,
  };
}

extension StatsBucketEntityMapper on StatsGranularity {
  StatsEntityGranularity toEntity() => switch (this) {
    .day => .day,
    .week => .week,
    .month => .month,
    .year => .year,  
  };
}
