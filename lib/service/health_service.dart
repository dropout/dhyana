import 'package:health/health.dart';

class HealthService {

  static const List<HealthDataType> healthDataTypes = [
    HealthDataType.MINDFULNESS,
  ];

  static const permissions = [
    HealthDataAccess.WRITE,
  ];


  final HealthFactory health = HealthFactory(useHealthConnectIfAvailable: true);

  Future<bool> hasHealthPermission() async {
    bool? hasPermission = await health.hasPermissions(
      healthDataTypes,
      // permissions: permissions
    );
    if (hasPermission == null) {
      return false;
    } else {
      return hasPermission;
    }
  }

  Future<bool> requestHealthPermission() {
    return health.requestAuthorization(
      healthDataTypes,
      // permissions: permissions
    );
  }

  Future<bool> writeData({
    required DateTime startTime,
    required DateTime endTime,
  }) {
    // return health.writeHealthData(10, HealthDataType.MINDFULNESS, startTime, endTime);
    return health.writeWorkoutData(HealthWorkoutActivityType.MEDITATION, startTime, endTime);
  }

}