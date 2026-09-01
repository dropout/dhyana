import 'package:faker/faker.dart';
import 'package:session/src/domain/entity/session_entity.dart';

extension FakerSessionExtension on Faker {
  SessionEntity createSessionEntity({SessionEntityType type = SessionEntityType.sitting}) {
    return SessionEntity(
      id: guid.guid(),
      type: type,
      startTime: DateTime.now().subtract(Duration(hours: 1)),
      endTime: DateTime.now(),
      duration: Duration(hours: 1),
    );
  }

}