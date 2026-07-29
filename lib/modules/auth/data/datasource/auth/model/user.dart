import 'package:flutter/foundation.dart';

import 'user_meta_data.dart';

@immutable
class User {

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
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! User) return false;
    return other.uid == uid &&
      other.metaData == metaData &&
      other.displayName == displayName &&
      other.email == email &&
      other.photoUrl == photoUrl &&
      _listEquals(other.roles, roles) &&
      other.accessLevel == accessLevel;
  }

  @override
  int get hashCode => Object.hash(
    uid,
    metaData,
    displayName,
    email,
    photoUrl,
    Object.hashAll(roles),
    accessLevel,
  );

  // Simple element-wise list equality for List<String>
  static bool _listEquals(List<String> a, List<String> b) {
    if (identical(a, b)) return true;
    if (a.length != b.length) return false;
    for (var i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }

  User copyWith({
    String? uid,
    UserMetaData? metaData,
    String? displayName,
    String? email,
    String? photoUrl,
    List<String>? roles,
    int? accessLevel,
  }) {
    return User(
      uid: uid ?? this.uid,
      metaData: metaData ?? this.metaData,
      displayName: displayName ?? this.displayName,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
      roles: roles ?? this.roles,
      accessLevel: accessLevel ?? this.accessLevel,
    );
  }

}
