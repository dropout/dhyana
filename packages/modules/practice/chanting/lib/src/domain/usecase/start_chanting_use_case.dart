import 'package:core/core.dart';
import 'package:chanting/src/domain/entity/caching_progress_entity.dart';
import 'package:chanting/src/domain/entity/chant_local_resources_entity.dart';
import 'package:chanting/src/domain/repository/chant_repository.dart';
import 'package:chanting/src/domain/service/chanting_audio_service.dart';
import 'package:chanting/src/domain/usecase/cache_chants_use_case.dart';


/// Use case for starting a chanting session, 
/// which involves caching selected chants
class StartChantingUseCase with LoggerMixin {
  final ChantRepository chantRepo;
  final CacheChantsUseCase cacheChantsUseCase;
  final ChantingAudioService chantingAudioService;

  StartChantingUseCase({
    required this.chantRepo,
    required this.cacheChantsUseCase,
    required this.chantingAudioService,
  });

  Stream<CachingProgressEntity> execute(List<String> selectedChantIds) async* {
    logger.t('Starting chanting with ${selectedChantIds.length} chants');

    // Stop any existing playback before setting up new chants
    await chantingAudioService.stop();

    // Load up-to-date chants from remote data source
    final availableChants = await chantRepo.queryAll();

    // Cache the chants and stream progress updates
    final cachingResultProgress = cacheChantsUseCase.execute(
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
  }
}
