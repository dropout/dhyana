import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
sealed class UserViewState with _$UserViewState {
  const UserViewState._();

  const factory UserViewState({
    required String uid,
    required UserMetaDataViewState metaData,
    String? displayName,
    String? email,
    String? photoUrl,
    @Default(<String>[]) List<String> roles,
    @Default(0) int accessLevel,
  }) = _UserViewState;
}

@freezed
sealed class UserMetaDataViewState with _$UserMetaDataViewState {
  const UserMetaDataViewState._();

  const factory UserMetaDataViewState({
    DateTime? creationTime,
    DateTime? lastSignInTime,
  }) = _UserMetaDataViewState;
}
