import 'package:profile/src/public/model/profile_session.dart';
import 'package:profile/src/domain/entity/profile_session_entity.dart';

extension ProfileSessionEntityMapper on ProfileSessionEntity {
  ProfileSession toApi() {
    return ProfileSession(
      id: id,
      type: switch (type) {
        .sitting => ProfileSessionType.sitting,
        .chanting => ProfileSessionType.chanting,
      },
      startTime: startTime,
      endTime: endTime,
      duration: duration,
    );
  }
}

extension ProfileSessionMapper on ProfileSession {
  ProfileSessionEntity toDomain() {
    return ProfileSessionEntity(
      id: id,
      type: switch (type) {
        .sitting => ProfileSessionEntityType.sitting,
        .chanting => ProfileSessionEntityType.chanting,
      },
      startTime: startTime,
      endTime: endTime,
      duration: duration,
    );
  }
}