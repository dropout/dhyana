import 'package:dhyana/core/util/logger_mixin.dart';
import 'package:dhyana/core/domain/entity/chant/chanting_settings.dart';
import 'package:dhyana/modules/practice/chanting/domain/entity/caching_progress.dart';
import 'package:dhyana/modules/practice/chanting/domain/entity/chant_local_resources.dart';
import 'package:dhyana/modules/practice/chanting/domain/service/chant_cache_manager.dart';
import 'package:dhyana/modules/practice/chanting/domain/service/chanting_audio_service.dart';

class StartChantingUseCase with LoggerMixin {

  final ChantCacheManager chantCacheManager;
  final ChantingAudioService chantingAudioService;

  StartChantingUseCase({
    required this.chantCacheManager,
    required this.chantingAudioService,
  });


  Stream<CachingProgress> execute(ChantingSettings chantingSettings) async* {
    // Prepare local resources for chanting
    logger.t('Setting up ${chantingSettings.selectedChants.length} chants');

      // emit(state.copyWith(loadingState: .loading));

      // Stop any existing playback before setting up new chants
      await chantingAudioService.stop();

      // Start caching and preparing chants for playback
      final chantViewModels = chantingSettings.selectedChants;
      final prepared = chantCacheManager.preparePlayableChantAssets(
        chantViewModels.map((viewModel) => viewModel.chantId).toList(growable: false),
      );

      // Update the state with caching progress as it occurs
      late CachingProgress cachingProgress;
      await for (final progress in prepared) {
        cachingProgress = progress;
        yield cachingProgress;
        // emit(state.copyWith(cachingProgress: cachingProgress));
      }

      // Take the final results and prepare the audio service
      List<ChantLocalResources> resources = cachingProgress.results
          .map((r) => r.localResources)
          .toList();
      await chantingAudioService.setup(resources);
      chantingAudioService.play();

      // emit(
      //   state.copyWith(
      //     loadingState: .loaded,
      //     cachingProgress: cachingProgress,
      //     chantResources: resources,
      //     startTime: DateTime.now(),
      //   ),
      // );

      logger.t('Chanting setup complete with ${resources.length} chants');

    // Setup audio service for chanting

    // 

  }

}
