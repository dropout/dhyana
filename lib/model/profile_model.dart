import 'package:dhyana/model/location.dart';
import 'package:dhyana/model/model.dart';

/// An abstract interface class representing a profile model that is used to
/// display profile information.
/// This class defines the structure and behavior of a profile model,
/// wether it is a complete user profile or a public profile that 
/// contains only public information.
abstract interface class ProfileModel implements Model {
  
  String get firstName;
  String get lastName;
  String get displayName;
  String? get photoUrl;
  String? get photoBlurhash;
  Location? get location;

  bool get hasProfileImage;  
  String get profileImagePath;
    
}
