import 'package:dhyana/core/util/logger_mixin.dart';
import 'package:dhyana/modules/practice/chanting/domain/entity/caching_progress_entity.dart';
import 'package:dhyana/modules/practice/chanting/domain/entity/chant_local_resources_entity.dart';
import 'package:dhyana/modules/practice/chanting/domain/repository/chant_cache_data_repository.dart';
import 'package:dhyana/modules/practice/chanting/domain/repository/chant_repository.dart';
import 'package:dhyana/modules/practice/chanting/domain/service/chanting_audio_service.dart';

class StartChantingUseCase with LoggerMixin {
  final ChantRepository chantRepo;
  final ChantCacheRepository chantCacheRepo;
  final ChantingAudioService chantingAudioService;

  StartChantingUseCase({
    required this.chantRepo,
    required this.chantCacheRepo,
    required this.chantingAudioService,
  });

  Stream<CachingProgressEntity> execute(List<String> selectedChantIds) async* {
    logger.t('Starting chanting with ${selectedChantIds.length} chants');

    // Stop any existing playback before setting up new chants
    await chantingAudioService.stop();

    // Load up-to-date chants from remote data source
    final availableChants = await chantRepo.queryAll();

    // Validate local cache against remote chants
    final cachingResultProgress = chantCacheRepo.cacheChants(
      selectedChantIds,
      availableChants,
    );

    // Update the state with caching progress as it occurs
    late CachingProgressEntity cachingProgress;
    await for (final progress in cachingResultProgress) {
      cachingProgress = progress;
      yield cachingProgress;
    }

    // Take the final results and prepare the audio service
    List<ChantLocalResourcesEntity> resources = cachingProgress.results
      .map((r) => r.localResources)
      .toList();
    await chantingAudioService.setup(resources);
    chantingAudioService.play();    

    logger.t('Chanting setup complete with ${resources.length} chants');

    // final validationResultList =
    //   chantCacheRepo.validateCacheForChants(uniqueChantIds, chants);

    // Start caching and preparing chants for playback

    // Start caching and preparing chants for playback
    // final prepared = chantCacheManager.preparePlayableChantAssets(
    //   selectedChantIds,
    // );

    // // Update the state with caching progress as it occurs
    // late CachingProgressEntity cachingProgress;
    // await for (final progress in prepared) {
    //   cachingProgress = progress;
    //   yield cachingProgress;
    // }

    // // Take the final results and prepare the audio service
    // List<ChantLocalResourcesEntity> resources = cachingProgress.results
    //     .map((r) => r.localResources)
    //     .toList();
    // await chantingAudioService.setup(resources);
    // chantingAudioService.play();

    // logger.t('Chanting setup complete with ${resources.length} chants');
  }
}
