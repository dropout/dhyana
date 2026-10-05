import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_meta_data_entity.freezed.dart';

@freezed
sealed class UserMetaDataEntity with _$UserMetaDataEntity {
  const UserMetaDataEntity._();

  const factory UserMetaDataEntity({
    DateTime? creationTime,
    DateTime? lastSignInTime,
  }) = _UserMetaDataEntity;
}
