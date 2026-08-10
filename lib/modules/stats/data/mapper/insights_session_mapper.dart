import 'package:dhyana/modules/stats/domain/entity/insights_session_entity.dart';
import 'package:dhyana/modules/stats/public/model/stats_session.dart';

extension InsightsSessionMapper on StatsSession {
  InsightsSessionEntity toEntity() {
    return InsightsSessionEntity(
      id: id,
      type: type,
      startTime: startTime,
      endTime: endTime,
      duration: duration,
    );
  }
}

extension InsightsSessionEntityMapper on InsightsSessionEntity {
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
