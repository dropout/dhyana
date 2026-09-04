import 'package:core/src/domain/entity/location.dart';

/// An abstract interface class representing a profile that can be displayed.
/// Generally this type is downcaated from [Profile].
/// Contract is made in the Profile Module's [ProfileStateCubit] implementation.
abstract interface class ProfileDisplayable {
  
  String get id;
  String get firstName;
  String get lastName;
  String get displayName;
  String? get photoBlurhash;
  Location? get location;

  bool get hasProfileImage;
  String get profileImageStoragePath;    
}

