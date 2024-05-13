import 'package:equatable/equatable.dart';

import 'user_meta_data.dart';

class User extends Equatable {

  final String uid;
  final UserMetaData metaData;
  final String? displayName;
  final String? email;
  final String? photoUrl;

  final List<String> roles;
  final int accessLevel;

  const User({
    required this.uid,
    required this.metaData,
    this.displayName,
    this.email,
    this.photoUrl,
    this.roles = const [],
    this.accessLevel = 0,
  });

  @override
  List<Object?> get props => [
    uid,
    metaData,
    displayName,
    email,
    photoUrl,
    roles,
    accessLevel,
  ];

}
