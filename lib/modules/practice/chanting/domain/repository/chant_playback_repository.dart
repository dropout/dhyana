import 'package:dhyana/modules/practice/chanting/domain/model/caching_progress.dart';

abstract interface class ChantPlaybackRepository {

  /// Prepares the specified chants for playback by ensuring that their audio 
  /// and lyrics assets are cached and valid.
  Stream<CachingProgress> preparePlayableAssets(List<String> chantIds);

  /// Clears all cached chant assets, removing them from local storage 
  /// and the cache database.
  Future<void> clearCache();

}
