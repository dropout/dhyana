import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:audio_service/audio_service.dart';

import 'package:core/core.dart';
import 'package:chanting/src/domain/entity/caching_progress_entity.dart';
import 'package:chanting/src/domain/entity/chant_local_resources_entity.dart';
import 'package:chanting/src/domain/entity/chanting_state_entity.dart';
import 'package:chanting/src/domain/service/chanting_audio_service.dart';
import 'package:chanting/src/domain/usecase/complete_chanting_use_case.dart';
import 'package:chanting/src/domain/usecase/load_lyrics_use_case.dart';
import 'package:chanting/src/domain/usecase/playback_state_change_use_case.dart';
import 'package:chanting/src/domain/usecase/start_chanting_use_case.dart';
import 'package:chanting/src/public/model/chanting_settings.dart';

/// Cubit responsible for managing the state of the chanting player, including
/// loading chants, controlling playback, and synchronizing lyrics display.
class ChantingCubit extends Cubit<ChantingStateEntity> with LoggerMixin {
  
  // Services
  final SessionNavigator sessionNavigator;
  final ChantingSettings chantingSettings;
  final ChantingAudioService audioService;
  final CrashlyticsService crashlyticsService;

  // Use cases
  final StartChantingUseCase startChantingUseCase;
  final LoadLyricsUseCase loadLyricsUseCase;
  final PlaybackStateChangeUseCase playbackStateChangeUseCase;
  final CompleteChantingUseCase completeChantingUseCase;

  // Stream subscriptions for audio service events
  StreamSubscription<PlaybackState>? _playbackStateSub;
  StreamSubscription<MediaItem?>? _mediaItemSub;
  StreamSubscription? _playlistCompletedSub;

  /// Creates a new instance of [ChantingCubit] with the provided services and settings.
  ChantingCubit({
    required this.chantingSettings,
    required this.audioService,
    required this.sessionNavigator,
    required this.startChantingUseCase,
    required this.loadLyricsUseCase,
    required this.playbackStateChangeUseCase,
    required this.completeChantingUseCase,
    required this.crashlyticsService,
  }) : super(
         ChantingStateEntity(
           chantingSettings: chantingSettings,
           playbackState: audioService.playbackState,
         ),
       ) {
    _init();
  }

  /// Initializes the cubit by setting up stream subscriptions
  Future<void> _init() async {
    try {
      _playbackStateSub = audioService.playbackStateStream.listen(
        _onPlaybackStateChanged,
      );
      _mediaItemSub = audioService.mediaItemStream.listen(_onMediaItemChanged);
      _playlistCompletedSub = audioService.playlistCompletedStream.listen(
        _onPlaylistCompleted,
      );
      _updateOutputLatency();
    } catch (e, st) {
      // emit(state.copyWith(playbackState: AudioPlaybackState.error));
      crashlyticsService.recordError(
        exception: e,
        stackTrace: st,
        reason: 'Error initializing ChantingCubit',
      );
    }
  }

  /// Sets up the chanting session by caching chants to local storage and
  /// preparing the audio service.
  Future<void> start() async {
    try {
      emit(state.copyWith(loadingState: .processing));
      final prepared = startChantingUseCase.execute(
        chantingSettings.selectedChants
            .map((e) => e.chantId)
            .toList(growable: false),
      );

      // Update the state with caching progress as it occurs
      late CachingProgressEntity cachingProgress;
      await for (final progress in prepared) {
        cachingProgress = progress;
        emit(state.copyWith(cachingProgress: cachingProgress));
      }

      // Take the final results and prepare the audio service
      List<ChantLocalResourcesEntity> resources = cachingProgress.results
          .map((r) => r.localResources)
          .toList();

      emit(
        state.copyWith(
          loadingState: .completed,
          cachingProgress: cachingProgress,
          chantResources: resources,
          startTime: DateTime.now(),
        ),
      );

      // logger.t('Chanting setup complete with ${resources.length} chants');
    } catch (e, st) {
      emit(state.copyWith(loadingState: .error));
      crashlyticsService.recordError(
        exception: e,
        stackTrace: st,
        reason: 'Error setting up chants: ${e.toString()}',
      );
    }
  }

  Future<void> _loadLyricsForChant(String chantId) async {
    try {
      // logger.t('Loading lyrics for chant ID: $chantId');
      emit(state.copyWith(lyricsLoadingState: ProcessingState.processing));
      final lyricsDocument = await loadLyricsUseCase.execute(chantId, state);

      // User quickly pressed back button
      if (isClosed) return;

      emit(
        state.copyWith(
          lyricsLoadingState: ProcessingState.completed,
          lyricsDocument: lyricsDocument,
        ),
      );
    } catch (e, st) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: st,
        reason: 'Error loading lyrics for chant $chantId',
      );
    }
  }

  /// Calculates the active lyrics line index based on the current position.
  void _playbackPositionUpdate(Duration position) {
    final activeLineIndex =
        state.lyricsDocument?.getExactLineIndex(position) ?? 0;

    // If position falls between two lines,
    // keep the line index unchanged until the next line is active
    if (activeLineIndex >= 0) {
      emit(state.copyWith(activeLineIndex: activeLineIndex));
    }
  }

  void _onPlaybackStateChanged(PlaybackState pbState) async {
    emit(await playbackStateChangeUseCase.execute(state, pbState));

    // Only update while playing
    if (pbState.playing) {
      _playbackPositionUpdate(state.latencyCompensatedPosition);
    }
  }

  void _onPlaylistCompleted(_) async {
    logger.t('Playlist completed');
    final result = await completeChantingUseCase.execute(state);
    emit(result.state);

    // Navigate to the session completed screen with the completed session data
    logger.t('Navigating to session completed screen');
    sessionNavigator.navigateToSessionCompletedScreen(
      startTime: state.startTime ?? DateTime.now().subtract(state.elapsedSessionTime),
      endTime: state.endTime ?? DateTime.now(),
      duration: state.duration,
      sessionType: .chanting,
    );
  }

  void _onMediaItemChanged(MediaItem? mediaItem) {
    if (mediaItem == null) return;
    emit(state.copyWith(mediaItem: mediaItem));
    _loadLyricsForChant(mediaItem.id);
    logger.t('Media item changed: ${mediaItem.title}');
  }

  /// When using a Bluetooth headset, we need to account for the output latency
  /// to keep the lyrics in sync with the audio.
  void _updateOutputLatency() async {
    final latency = await audioService.outputLatency;
    emit(state.copyWith(outputLatency: latency));
    logger.t('Output latency updated: ${latency.inMilliseconds} ms');
  }

  /// Start/resume playback.
  /// Updates the output latency before playing to ensure lyrics stay in sync.
  Future<void> play() async {
    _updateOutputLatency();
    return audioService.play();
  }

  /// Pause playback.
  Future<void> pause() => audioService.pause();

  /// Seeks to the specified position in the current chant.
  Future<void> seek(Duration position) async {
    await audioService.seek(position);
    logger.t('Seek to position: ${position.formatHHMMSSmm()}');
  }

  /// Seeks to the start of the specified lyrics line index.
  Future<void> seekToLine(int lineIndex) async {
    final targetPosition = state.lyricsDocument?.lines[lineIndex].start;
    if (targetPosition != null && lineIndex != state.activeLineIndex) {
      emit(state.copyWith(activeLineIndex: lineIndex));
      // emit(state.copyWith(playbackState: state.playbackState.copyWith(updatePosition: targetPosition)));
      seek(targetPosition);
    } else {
      // logger.w('Attempted to seek to line index $lineIndex, but it is out of bounds');
    }
  }

  /// Moves to the previous track in the playlist,
  /// or restarts the current track if it's the first track
  Future<void> prev() => audioService.prev();

  /// Moves to the next track in the playlist, if not already at the last track.
  Future<void> next() => audioService.next();

  @override
  Future<void> close() {
    _playbackStateSub?.cancel();
    _playlistCompletedSub?.cancel();
    _mediaItemSub?.cancel();
    audioService.stop();
    return super.close();
  }
  
}
