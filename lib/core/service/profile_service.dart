
class UpdateSessionData {
  final String id;
  final String sessionTypeName;
  final DateTime startTime;
  final DateTime endTime;
  final Duration duration;

  const UpdateSessionData({
    required this.id,
    required this.sessionTypeName,
    required this.startTime,
    required this.endTime,
    required this.duration,
  });
}

abstract class ProfileService {

  Future<void> updateProfileStatsWithSession(
    String profileId,
    UpdateSessionData updateSessionData,
  );


}