import 'package:dhyana/modules/auth/data/datasource/auth/enum/auth_provider_type.dart';
import 'package:dhyana/modules/auth/data/datasource/auth/model/auth_user.dart';
import 'package:dhyana/modules/auth/data/datasource/auth/model/auth_user_meta_data.dart';
import 'package:dhyana/modules/auth/domain/entity/user_entity.dart';
import 'package:dhyana/modules/auth/domain/entity/user_meta_data_entity.dart';
import 'package:dhyana/modules/auth/domain/enum/signin_auth_provider_type.dart';

extension AuthUserMapper on AuthUser {
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

extension UserMapper on UserEntity {
  AuthUser toData() {
    return AuthUser(
      uid: uid,
      metaData: metaData.toData(),
      displayName: displayName,
      email: email,
      photoUrl: photoUrl,
      roles: roles,
      accessLevel: accessLevel,
    );
  }
}

extension AuthUserMetaDataMapper on AuthUserMetaData {
  UserMetaDataEntity toDomain() {
    return UserMetaDataEntity(
      creationTime: creationTime,
      lastSignInTime: lastSignInTime,
    );
  }
}

extension UserMetaDataMapper on UserMetaDataEntity {
  AuthUserMetaData toData() {
    return AuthUserMetaData(
      creationTime: creationTime,
      lastSignInTime: lastSignInTime,
    );
  }
}

extension SigninMethodTypeMapper on SigninAuthProviderType {
  AuthProviderType toData() {
    return switch (this) {
      SigninAuthProviderType.apple => AuthProviderType.apple,
      SigninAuthProviderType.google => AuthProviderType.google,
    };
  }
}
