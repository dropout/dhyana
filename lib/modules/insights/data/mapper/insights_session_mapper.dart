import 'package:dhyana/modules/insights/domain/entity/insights_session_entity.dart';
import 'package:dhyana/modules/insights/public/model/insights_session.dart';

extension InsightsSessionMapper on InsightsSession {
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
  InsightsSession toApi() {
    return InsightsSession(
      id: id,
      type: type,
      startTime: startTime,
      endTime: endTime,
      duration: duration,
    );
  }
}
