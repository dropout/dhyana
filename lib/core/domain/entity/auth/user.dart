import 'package:freezed_annotation/freezed_annotation.dart';

import 'user_meta_data.dart';

part 'user.freezed.dart';

@freezed
sealed class User with _$User {
  const User._();

  const factory User({
    required String uid,
    required UserMetaData metaData,
    String? displayName,
    String? email,
    String? photoUrl,
    @Default(<String>[]) List<String> roles,
    @Default(0) int accessLevel,
  }) = _User;
}
