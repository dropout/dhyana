import 'package:dhyana/modules/auth/domain/entity/user_entity.dart';
import 'package:dhyana/modules/auth/domain/entity/user_meta_data_entity.dart';

import 'state.dart';

extension UserToViewStateMapper on UserEntity {
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
  UserEntity toDomain() {
    return UserEntity(
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

extension UserMetaDataToViewStateMapper on UserMetaDataEntity {
  UserMetaDataViewState toViewState() {
    return UserMetaDataViewState(
      creationTime: creationTime,
      lastSignInTime: lastSignInTime,
    );
  }
}

extension UserMetaDataViewStateToDomainMapper on UserMetaDataViewState {
  UserMetaDataEntity toDomain() {
    return UserMetaDataEntity(
      creationTime: creationTime,
      lastSignInTime: lastSignInTime,
    );
  }
}
