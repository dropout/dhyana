import 'package:dhyana/modules/auth/domain/entity/user.dart';
import 'package:dhyana/modules/auth/domain/entity/user_meta_data.dart';

import 'state.dart';

extension UserToViewStateMapper on User {
  UserViewState toViewState() {
    return UserViewState(
      uid: uid,
      metaData: metaData.toViewState(),
      displayName: displayName,
      email: email,
      photoUrl: photoUrl,
      roles: roles,
      accessLevel: accessLevel,
    );
  }
}

extension UserViewStateToDomainMapper on UserViewState {
  User toDomain() {
    return User(
      uid: uid,
      metaData: metaData.toDomain(),
      displayName: displayName,
      email: email,
      photoUrl: photoUrl,
      roles: roles,
      accessLevel: accessLevel,
    );
  }
}

extension UserMetaDataToViewStateMapper on UserMetaData {
  UserMetaDataViewState toViewState() {
    return UserMetaDataViewState(
      creationTime: creationTime,
      lastSignInTime: lastSignInTime,
    );
  }
}

extension UserMetaDataViewStateToDomainMapper on UserMetaDataViewState {
  UserMetaData toDomain() {
    return UserMetaData(
      creationTime: creationTime,
      lastSignInTime: lastSignInTime,
    );
  }
}
