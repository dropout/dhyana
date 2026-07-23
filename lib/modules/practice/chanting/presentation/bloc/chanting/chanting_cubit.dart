import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:dhyana/core/domain/enum/loading_state.dart';
import 'package:dhyana/modules/practice/chanting/domain/model/caching_progress.dart';
import 'package:dhyana/modules/practice/chanting/domain/model/chant_local_resources.dart';
import 'package:dhyana/modules/practice/chanting/domain/model/lyrics_document.dart';
import 'package:dhyana/modules/practice/chanting/domain/repository/chant_playback_repository.dart';
import 'package:dhyana/modules/practice/chanting/domain/service/chanting_audio_service.dart';
import 'package:dhyana/core/domain/service/crashlytics_service.dart';
import 'package:dhyana/modules/practice/chanting/domain/service/lyrics_service.dart';
import 'package:dhyana/core/domain/service/resource_resolver.dart';
import 'package:dhyana/util/duration.dart';
import 'package:dhyana/util/logger_mixin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/modules/practice/chanting/domain/model/chanting_settings.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chanting_state.dart';
part 'chanting_cubit.freezed.dart';

/// Cubit responsible for managing the state of the chanting player, including
/// loading chants, controlling playback, and synchronizing lyrics display.
class ChantingCubit extends Cubit<ChantingState> with LoggerMixin {
  final ChantingSettings chantingSettings;
  final ChantingAudioService audioService;
  final LyricsService lyricsService;
  final ResourceResolver resourceResolver;
  final ChantPlaybackRepository chantPlaybackRepository;
  final CrashlyticsService crashlyticsService;

  StreamSubscription<PlaybackState>? _playbackStateSub;
  StreamSubscription<MediaItem?>? _mediaItemSub;

  /// Creates a new instance of [ChantingCubit] with the provided services and settings.
  ChantingCubit({
    required this.chantingSettings,
    required this.audioService,
    required this.lyricsService,
    required this.resourceResolver,
    required this.chantPlaybackRepository,
    required this.crashlyticsService,
  }) : super(
         ChantingState(
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
  Future<void> setup(ChantingSettings chantingSettings) async {
    try {
      logger.t('Setting up ${chantingSettings.selectedChants.length} chants');

      emit(state.copyWith(loadingState: .loading));

      // Stop any existing playback before setting up new chants
      await audioService.stop();

      // Start caching and preparing chants for playback
      final chantViewModels = chantingSettings.selectedChants;
      final prepared = chantPlaybackRepository.preparePlayableAssets(
        chantViewModels.map((viewModel) => viewModel.chant.id).toList(growable: false),
      );

      // Update the state with caching progress as it occurs
      late CachingProgress cachingProgress;
      await for (final progress in prepared) {
        cachingProgress = progress;
        emit(state.copyWith(cachingProgress: cachingProgress));
      }

      // Take the final results and prepare the audio service
      List<ChantLocalResources> resources = cachingProgress.results
          .map((r) => r.localResources)
          .toList();
      await audioService.setup(resources);

      emit(
        state.copyWith(
          loadingState: .loaded,
          cachingProgress: cachingProgress,
          chantResources: resources,
          startTime: DateTime.now(),
        ),
      );

      logger.t('Chanting setup complete with ${resources.length} chants');
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
      logger.t('Loading lyrics for chant ID: $chantId');
      emit(state.copyWith(lyricsLoadingState: LoadingState.loading));
      final lyricsPath = state.chantResources
          .firstWhere((r) => r.id == chantId)
          .lyricsLocalPath;

      final lyricsDocument = await lyricsService.loadLyrics(lyricsPath);

      // User quickly pressed back button
      if (isClosed) return;

      emit(
        state.copyWith(
          lyricsLoadingState: LoadingState.loaded,
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

  void _onPlaybackStateChanged(PlaybackState pbState) {

    // Update the elapsed session time based on the PlaybackState.updateTime
    // by comparing previous and current PlaybackState.updateTime 
    // only when the audio is playing.
    var elapsedSessionTime = state.elapsedSessionTime;
    if (state.playbackState.playing == true && pbState.playing == true) {
      final previousUpdateTime = state.playbackState.updateTime;
      final currentUpdateTime = pbState.updateTime;
      elapsedSessionTime += currentUpdateTime.difference(previousUpdateTime);
    }
    
    emit(
      state.copyWith(
        playbackState: pbState, 
        elapsedSessionTime: elapsedSessionTime
      )
    );

    // Only update while playing
    if (pbState.playing) {
      _playbackPositionUpdate(state.latencyCompensatedPosition);
    }

    if (pbState.processingState == AudioProcessingState.completed &&
        pbState.queueIndex ==
            state.chantingSettings.selectedChants.length - 1) {
      logger.t('Chanting session completed $pbState');
      emit(state.copyWith(endTime: DateTime.now()));
      return;
    } else if (pbState.processingState == AudioProcessingState.completed) {
      logger.t('Track completed, moving to next track');
    }
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
    _mediaItemSub?.cancel();
    audioService.stop();
    return super.close();
  }
}
