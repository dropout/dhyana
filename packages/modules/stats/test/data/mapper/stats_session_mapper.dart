import 'package:stats/src/public/model/stats_session.dart';
import 'package:stats/src/domain/entity/stats_session_entity.dart';

extension StatsSessionMapper on StatsSession {
  StatsSessionEntity toDomain() {
    return StatsSessionEntity(
      id: id,
      type: switch (type) {
        .sitting => .sitting,
        .chanting => .chanting,
      },
      startTime: startTime,
      endTime: endTime,
      duration: duration,
    );
  }
}

extension StatsSessionEntityMapper on StatsSessionEntity {
  StatsSession toApi() {
    return StatsSession(
      id: id,
      type: switch (type) {
        .sitting => .sitting,
        .chanting => .chanting,
      },
      startTime: startTime,
      endTime: endTime,
      duration: duration,
    );
  }
}
