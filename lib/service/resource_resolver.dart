import 'package:dhyana/model/profile.dart';

abstract interface class ResourceResolver {

  Future<String> getProfileImageUrl(Profile profile);

}


