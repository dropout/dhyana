import 'package:dhyana/model/profile.dart';

abstract interface class ResourceResolver {

  Future<String> getProfileImageUrl(Profile profile);
  Future<String> getChantAudioUrl(String chantId);
  Future<String> getChantLyricsUrl(String chantId);

}


