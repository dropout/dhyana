import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_meta_data.freezed.dart';

@freezed
sealed class UserMetaData with _$UserMetaData {
  const UserMetaData._();

  const factory UserMetaData({
    DateTime? creationTime,
    DateTime? lastSignInTime,
  }) = _UserMetaData;
}
