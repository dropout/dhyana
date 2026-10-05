import 'auth_user_meta_data.dart';

class AuthUser {
  final String uid;
  final AuthUserMetaData metaData;
  final String? displayName;
  final String? email;
  final String? photoUrl;
  final List<String> roles;
  final int accessLevel;

  AuthUser({
    required this.uid,
    required this.metaData,
    this.displayName,
    this.email,
    this.photoUrl,
    this.roles = const <String>[],
    this.accessLevel = 0,
  });
}