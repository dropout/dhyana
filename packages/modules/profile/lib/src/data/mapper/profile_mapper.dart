import 'package:profile/src/data/mapper/profile_settings_mapper.dart';
import 'package:profile/src/data/mapper/profile_stats_report_mapper.dart';
import 'package:profile/src/domain/entity/profile_entity.dart';
import 'package:profile/src/public/model/profile.dart';

extension ProfileEntityMapper on ProfileEntity {
  Profile toApi() {
    return Profile(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      photoUrl: photoUrl,
      photoBlurhash: photoBlurhash,
      settings: settings.toApi(),
      signupDate: signupDate,
      statsReport: statsReport.toApi(),
      completed: completed,
    );
  }  
}

extension ProfileMapper on Profile {
  ProfileEntity toDomain() {
    return ProfileEntity(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      photoUrl: photoUrl,
      photoBlurhash: photoBlurhash,
      settings: settings.toDomain(),
      signupDate: signupDate,
      statsReport: statsReport.toDomain(),
      completed: completed,
    );
  }
}