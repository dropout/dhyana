import 'package:dhyana/modules/practice/session/domain/entity/session_entity.dart';
import 'package:dhyana/modules/practice/session/public/model/session.dart';


extension SessionMapper  on SessionEntity {
  Session toApi() {
    return Session(
      id: id,
      type: type,
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
      type: type,
      startTime: startTime,
      endTime: endTime,
      duration: duration,
    );
  }
}
