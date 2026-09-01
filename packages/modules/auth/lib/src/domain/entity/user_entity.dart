import 'package:freezed_annotation/freezed_annotation.dart';

import 'user_meta_data_entity.dart';

part 'user_entity.freezed.dart';

@freezed
sealed class UserEntity with _$UserEntity {
  const UserEntity._();

  const factory UserEntity({
    required String uid,
    required UserMetaDataEntity metaData,
    String? displayName,
    String? email,
    String? photoUrl,
    @Default(<String>[]) List<String> roles,
    @Default(0) int accessLevel,
  }) = _UserEntity;
}
