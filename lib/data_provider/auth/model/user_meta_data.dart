import 'package:flutter/foundation.dart';

@immutable
class UserMetaData {
  final DateTime? creationTime;
  final DateTime? lastSignInTime;

  const UserMetaData({
    this.creationTime,
    this.lastSignInTime,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserMetaData &&
      other.creationTime == creationTime &&
      other.lastSignInTime == lastSignInTime;
  }

  @override
  int get hashCode => Object.hash(creationTime, lastSignInTime);

  UserMetaData copyWith({
    DateTime? creationTime,
    DateTime? lastSignInTime,
  }) {
    return UserMetaData(
      creationTime: creationTime ?? this.creationTime,
      lastSignInTime: lastSignInTime ?? this.lastSignInTime,
    );
  }

  @override
  String toString() {
    return 'UserMetaData(creationTime: $creationTime, lastSignInTime: $lastSignInTime)';
  }

}
