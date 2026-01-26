import 'package:dhyana/data_provider/storage_data_provider.dart';
import 'package:dhyana/model/profile.dart';
import '../resource_resolver.dart';

class DefaultResourceResolver implements ResourceResolver {

  final StorageDataProvider storageDataProvider;

  DefaultResourceResolver({
    required this.storageDataProvider,
  });

  @override
  Future<String> getProfileImageUrl(Profile profile) {
    String imageFilename = 'photo.jpg';
    String path = '/profiles/${profile.id}/$imageFilename';
    return storageDataProvider.getDownloadURL(path);
  }

}
