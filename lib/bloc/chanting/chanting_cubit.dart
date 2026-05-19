import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:dhyana/enum/loading_state.dart';
import 'package:dhyana/model/lyrics_document.dart';
import 'package:dhyana/service/chanting_audio_service.dart';
import 'package:dhyana/service/crashlytics_service.dart';
import 'package:dhyana/service/lyrics_service.dart';
import 'package:dhyana/service/resource_resolver.dart';
import 'package:dhyana/util/duration.dart';
import 'package:dhyana/util/logger_mixin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/model/chanting_settings.dart';
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
  final CrashlyticsService crashlyticsService;

  StreamSubscription<PlaybackState>? _playbackStateSub;
  StreamSubscription<MediaItem?>? _mediaItemSub;

  /// Creates a new instance of [ChantingCubit] with the provided services and settings.
  ChantingCubit({
    required this.chantingSettings,
    required this.audioService,
    required this.lyricsService,
    required this.resourceResolver,
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

  Future<void> setup(
    ChantingSettings chantingSettings,
  ) async {
    try {
      logger.t('Setting up ${chantingSettings.selectedChants.length} chants');

      emit(state.copyWith(isLoading: true));

      await audioService.stop();

      // load audio
      final chants = chantingSettings.selectedChants;
      final resourceUrls = <String, String>{};

      for (var chant in chants) {
        final url = await resourceResolver.getChantAudioUrl(chant.id);
        resourceUrls[chant.id] = url;
      }

      // Duration of the first item in the playlist
      await audioService.setup(chantingSettings, resourceUrls);

      emit(state.copyWith(isLoading: false));
    } catch (e, st) {
      emit(
        state.copyWith(
          isLoading: false,
          // playbackState: AudioPlaybackState.error,
        ),
      );
      crashlyticsService.recordError(
        exception: e,
        stackTrace: st,
        reason: 'Error setting up chants',
      );
    }
  }

  Future<void> _loadLyricsForChant(String chantId) async {
    try {
      logger.t('Loading lyrics for chant ID: $chantId');
      emit(state.copyWith(lyricsLoadingState: LoadingState.loading));
      final lyricsUrl = await resourceResolver.getChantLyricsUrl(chantId);
      final lyricsDocument = await lyricsService.loadLyrics(lyricsUrl);

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
    emit(state.copyWith(playbackState: pbState));

    // Only update while playing
    if (pbState.playing) {
      _playbackPositionUpdate(state.latencyCompensatedPosition);
    }

    if (pbState.processingState == AudioProcessingState.completed &&
        pbState.queueIndex ==
            state.chantingSettings.selectedChants.length - 1) {
      logger.t('Chanting session completed $pbState');
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
