import 'package:dhyana/model/profile.dart';

abstract class ResourceResolver {

  Future<String> getProfileImageUrl(Profile profile);

}


