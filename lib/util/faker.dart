import 'package:dhyana/util/default_profile_data.dart';
import 'package:faker/faker.dart';

extension FakerExtension on Faker {

  String profilePhotoUrl() {
    return DefaultProfileData.photoUrl;
  }

  String profilePhotoBlurhash() {
    return DefaultProfileData.photoBlurhash;
  }

}
