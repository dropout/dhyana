import 'package:equatable/equatable.dart';

class UserMetaData extends Equatable {

  final DateTime? creationTime;
  final DateTime? lastSignInTime;

  const UserMetaData({
    this.creationTime,
    this.lastSignInTime,
  });

  @override
  List<Object?> get props => [creationTime, lastSignInTime];

  @override
  String toString() {
    return 'UserMetaData(creationTime: $creationTime, lastSignInTime: $lastSignInTime)';
  }

}
