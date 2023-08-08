import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class User extends Equatable {

  final String uid;
  final firebase_auth.UserMetadata metadata;
  final String? displayName;
  final String? email;
  final String? photoUrl;

  final List<String> roles;
  final int accessLevel;

  const User({
    required this.uid,
    required this.metadata,
    this.displayName,
    this.email,
    this.photoUrl,
    this.roles = const [],
    this.accessLevel = 0,
  });

  @override
  List<Object?> get props => [
    uid,
    metadata,
    displayName,
    email,
    photoUrl,
    roles,
    accessLevel,
  ];

}
