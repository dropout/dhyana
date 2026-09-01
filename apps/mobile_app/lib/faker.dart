import 'package:faker/faker.dart';
import 'package:core/core.dart';


extension FakerExtension on Faker {

  String profilePhotoUrl() {
    return DefaultProfileData.photoUrl;
  }

  String profilePhotoBlurhash() {
    return DefaultProfileData.photoBlurhash;
  }

}
