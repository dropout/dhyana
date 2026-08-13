import 'package:dhyana/modules/stats/domain/entity/insights_session_entity.dart';
import 'package:dhyana/modules/stats/public/model/stats_session.dart';

extension StatsSessionMapper on StatsSession {
  StatsSessionEntity toEntity() {
    return StatsSessionEntity(
      id: id,
      type: type,
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
      type: type,
      startTime: startTime,
      endTime: endTime,
      duration: duration,
    );
  }
}
