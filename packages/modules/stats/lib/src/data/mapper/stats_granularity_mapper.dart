import 'package:stats/src/domain/enum/stats_entity_granularity.dart';
import 'package:stats/src/public/enum/stats_granularity.dart';

extension StatsGranularityMapper on StatsEntityGranularity {
  StatsGranularity toApi() => switch (this) {
    .days => .days,
    .weeks => .weeks,
    .months => .months,
    .years => .years,
  };
}

extension StatsBucketEntityMapper on StatsGranularity {
  StatsEntityGranularity toEntity() => switch (this) {
    .days => .days,
    .weeks => .weeks,
    .months => .months,
    .years => .years,  
  };
}
