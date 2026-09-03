import 'package:session/src/domain/entity/session_entity.dart';
import 'package:session/src/public/model/session.dart';


extension SessionMapper on SessionEntity {
  Session toApi() {
    return Session(
      id: id,
      type: switch (type) {
        .timer => .timer,
        .chanting => .chanting,
      },
      startTime: startTime,
      endTime: endTime,
      duration: duration,
    );
  }
}

extension SessionEntityMapper on Session {
  SessionEntity toEntity() {
    return SessionEntity(
      id: id,
      type: switch (type) {
        .timer => .timer,
        .chanting => .chanting,
      },
      startTime: startTime,
      endTime: endTime,
      duration: duration,
    );
  }
}
