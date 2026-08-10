import 'package:dhyana/modules/stats/domain/enum/stats_entity_granularity.dart';
import 'package:dhyana/modules/stats/public/enum/stats_granularity.dart';

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
