import 'package:dhyana/model/location.dart';
import 'package:dhyana/model/model.dart';

abstract interface class ProfileModel implements Model {
  
  String get firstName;
  String get lastName;
  String get photoUrl;
  String get photoBlurhash;
  Location? get location;

  String get displayName;
  String get profileImagePath;
  
}
