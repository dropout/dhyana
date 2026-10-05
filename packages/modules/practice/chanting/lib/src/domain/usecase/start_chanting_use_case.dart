import 'package:clock/clock.dart';
import 'package:core/core.dart';
import 'package:chanting/src/domain/entity/caching_progress_entity.dart';
import 'package:chanting/src/domain/entity/chant_local_resources_entity.dart';
import 'package:chanting/src/domain/repository/chant_repository.dart';
import 'package:chanting/src/domain/service/chanting_app_port.dart';
import 'package:chanting/src/domain/service/chanting_audio_service.dart';
import 'package:chanting/src/domain/usecase/cache_chants_use_case.dart';


/// Use case for starting a chanting session, 
/// which involves caching selected chants
class StartChantingUseCase with LoggerMixin {
  final ChantRepository chantRepo;
  final CacheChantsUseCase cacheChantsUseCase;
  final ChantingAudioService chantingAudioService;
  final ChantingAppPort chantingAppPort;

  StartChantingUseCase({
    required this.chantRepo,
    required this.cacheChantsUseCase,
    required this.chantingAudioService,
    required this.chantingAppPort,
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
    _showPresence();

    logger.t('Chanting setup complete with ${resources.length} chants');
  }

  /// Presence is best-effort and must never break chanting.
  Future<void> _showPresence() async {
    try {
      final authData = await chantingAppPort.getAuthSession();
      final userId = authData.userId;
      if (!authData.isAuthenticated || userId == null) {
        logger.t('User is not authenticated, skipping presence');
        return;
      }

      final profile = await chantingAppPort.getProfile(
        userId,
        preferCache: true,
      );
      if (!profile.settings.usePresenceFeature) {
        logger.t('User has disabled presence feature, skipping presence');
        return;
      }

      await chantingAppPort.showPresence(
        profileId: profile.id,
        firstName: profile.firstName,
        lastName: profile.lastName,
        photoBlurhash: profile.photoBlurhash,
        location: profile.location,
        startedAt: clock.now(),
      );
    } catch (e, stack) {
      logger.e('Unable to show presence', error: e, stackTrace: stack);
    }
  }
}
