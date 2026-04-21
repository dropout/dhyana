import '../resource_resolver.dart';

class DefaultResourceResolver extends ResourceResolver {

  DefaultResourceResolver({required super.storageDataProvider});

  @override
  Future<String> getProfileImageUrl(String profileId) {
    String imageFilename = 'photo.jpg';
    String path = '/profiles/$profileId/$imageFilename';
    return storageDataProvider.getDownloadURL(path);
  }

  @override
  Future<String> getChantAudioUrl(String chantId) {
    String audioFilename = 'chant.mp3';
    String path = '/chants/$chantId/$audioFilename';
    return storageDataProvider.getDownloadURL(path);
  }

  @override
  Future<String> getChantLyricsUrl(String chantId) {
    String lyricsFilename = 'chant.ass';
    String path = '/chants/$chantId/$lyricsFilename';
    return storageDataProvider.getDownloadURL(path);
  }
}
