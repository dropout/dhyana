import 'dart:async';
import 'dart:math';

import 'package:dhyana/enum/playback_state.dart';
import 'package:dhyana/model/chant.dart';
import 'package:dhyana/model/lyrics_document.dart';
import 'package:dhyana/service/audio_service.dart';
import 'package:dhyana/service/crashlytics_service.dart';
import 'package:dhyana/service/default/all.dart';
import 'package:dhyana/service/lyrics_service.dart';
import 'package:dhyana/service/resource_resolver.dart';
import 'package:dhyana/service/timer_service.dart';
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
  final AudioService audioService;
  final LyricsService lyricsService;
  final ResourceResolver resourceResolver;
  final CrashlyticsService crashlyticsService;

  StreamSubscription? _positionSubscription;
  StreamSubscription? _playbackStateSubscription;

  TimerService? _gapTimerService;

  /// Creates a new instance of [ChantingCubit] with the provided services and settings.
  ChantingCubit({
    required this.chantingSettings,
    required this.audioService,
    required this.lyricsService,
    required this.resourceResolver,
    required this.crashlyticsService,
  }) : super(ChantingState(chantingSettings: chantingSettings)) {
    _init();
  }

  Stream<Duration> get positionStream => audioService.positionStream.distinct();

  /// Initializes the cubit by setting up stream subscriptions 
  /// and loading/playing the first chant.
  Future<void> _init() async {
    try {
      _positionSubscription = audioService.positionStream.distinct().listen(
        _onPositionChanged,
      );
      _playbackStateSubscription = audioService.playbackStateStream
        .listen(_onPlaybackStateChanged);
      if (state.chantingSettings.selectedChants.isNotEmpty) {
        final firstChant = state.chantingSettings.selectedChants.first;
        await _loadChant(firstChant);
        play();
      }
    } catch (e, st) {
      emit(state.copyWith(playbackState: PlaybackState.error));
      crashlyticsService.recordError(
        exception: e,
        stackTrace: st,
        reason: 'Error initializing ChantingCubit',
      );
    }
  }

  /// Responsible for loading a chant's audio and lyrics, 
  /// and updating the state accordingly.
  Future<void> _loadChant(Chant chant) async {
    try {
      emit(state.copyWith(playbackState: PlaybackState.loading));
      
      // load lyrics
      final lyricsUrl = await resourceResolver.getChantLyricsUrl(chant.id);
      final lyricsDocument = await lyricsService.loadLyrics(lyricsUrl);

      // load audio
      final url = await resourceResolver.getChantAudioUrl(chant.id);
      final duration = await audioService.loadFromUrl(url);

      emit(
        state.copyWith(
          duration: duration ?? Duration.zero,
          position: Duration.zero,
          lyricsDocument: lyricsDocument,
        ),
      );
      logger.t('Chant loaded: ${chant.name}, duration: ${duration?.inSeconds ?? 'unknown'} seconds');
    } catch (e, st) {
      emit(state.copyWith(playbackState: PlaybackState.error));
      crashlyticsService.recordError(
        exception: e,
        stackTrace: st,
        reason: 'Error loading chant ${chant.name}',
      );
    }
  }

  /// Handles position updates from the audio service, updating the current position
  /// and active lyrics line index in the state.
  void _onPositionChanged(Duration position) {

    final activeLineIndex =
      state.lyricsDocument?.activeLineIndex(position) ?? 0;

    // If position falls between two lines,
    // keep the line index unchanged until the next line is active
    if (activeLineIndex == -1) {
      emit(state.copyWith(position: position));
    } else {
      emit(state.copyWith(
        position: position, 
        activeLineIndex: activeLineIndex
      ));
    }

  }

  /// Handles starting a gap after a chant finishes.  
  void _onPlaybackStateChanged(PlaybackState playbackState) {
    emit(state.copyWith(playbackState: playbackState));    
    if (playbackState == PlaybackState.completed) {
      final isLastChant =
        state.currentIndex ==
        state.chantingSettings.selectedChants.length - 1;
      if (!isLastChant) {
        _startGap();
      }
    }
    logger.t('Playback state changed: $playbackState');
  }

  /// Starts the gap timer and updates the state to indicate that the gap is active.
  void _startGap() {
    _gapTimerService?.close();

    // Initialize gaptimer
    _gapTimerService =
      DefaultTimerService(
          duration: chantingSettings.gapLength,
          tickIntervalInMilliSeconds: 250,
        )
        ..onTick(_onGapTick)
        ..onFinished(_onGapFinished);

    emit(
      state.copyWith(
        gapRemaining: chantingSettings.gapLength,
        playbackState: PlaybackState.playing,
      ),
    );
    _gapTimerService!.start();
    logger.t('Gap started: ${chantingSettings.gapLength.inSeconds} seconds');
  }

  /// Cancels the gap timer and updates the state to indicate 
  /// that the gap is no longer active.
  void _cancelGap() {
    _gapTimerService?.close();
    _gapTimerService = null;
    emit(state.copyWith(gapRemaining: Duration.zero));
  }

  /// Handles gap timer tick events, updating the remaining gap time in the state.
  void _onGapTick(int tick) {
    final ts = _gapTimerService!;
    final remaining = ts.remainingTime;
    emit(state.copyWith(gapRemaining: remaining));
  }

  /// Handles the completion of the gap timer, advancing to the next track.
  void _onGapFinished() {
    _gapTimerService?.close();
    _gapTimerService = null;
    
    _advanceToNextTrack();
    logger.t('Gap finished, advancing to next track');
  }

  /// Advances to the next track in the playlist, loading it and starting playback.
  Future<void> _advanceToNextTrack() async {
    final newIndex = state.currentIndex + 1;
    final chant = state.chantingSettings.selectedChants[newIndex];
    await _loadChant(chant);    
    emit(state.copyWith(
      currentIndex: newIndex,
      gapRemaining: Duration.zero,
    ));
    play();
    logger.t('Auto-advanced to chant index $newIndex');
  }

  /// Starts playback. If a gap is active, starts the gap timer; 
  ///otherwise, starts audio playback.
  Future<void> play() async {
    if (state.isGapActive) {
      _gapTimerService?.start();
      emit(state.copyWith(playbackState: PlaybackState.playing));
    } else {
      audioService.play();
      logger.t('Playback started');
    }
  }

  /// Pauses playback. If a gap is active, pauses the gap timer;
  /// otherwise, pauses audio playback.
  Future<void> pause() async {
    if (state.isGapActive) {
      _gapTimerService?.stop();
      emit(state.copyWith(playbackState: PlaybackState.paused));
    } else {
      audioService.pause();
      logger.t('Playback paused');
    }
  }

  /// Seeks to the specified position in the current chant.
  Future<void> seek(Duration position) async {
    await audioService.seek(position);
    logger.t('Seek to position: ${position.inSeconds} seconds');
  }

  /// Moves to the previous track in the playlist, 
  /// or restarts the current track if already at the first track.
  Future<void> prev() async {
    _cancelGap();

    if (state.currentIndex == 0) {
      // If user tries to go to previous track when the first track is active, restart the current track
      await audioService.seek(Duration.zero);
      play();
      logger.t('Restarted current chant since it is the first chant in the playlist');
      return;
    }

    if (state.currentIndex > 0) {
      final newIndex = state.currentIndex - 1;
      final chant = state.chantingSettings.selectedChants[newIndex];
      _gapTimerService?.close();
      emit(state.copyWith(currentIndex: newIndex));
      await audioService.seek(Duration.zero);
      await _loadChant(chant);
      play();
      logger.t('Moved to previous chant index $newIndex');
    }
  }

  /// Moves to the next track in the playlist, if not already at the last track.
  Future<void> next() async {
    _cancelGap();
    if (state.currentIndex < state.chantingSettings.selectedChants.length - 1) {
      final newIndex = state.currentIndex + 1;
      final chant = state.chantingSettings.selectedChants[newIndex];
      _gapTimerService?.close();
      emit(state.copyWith(currentIndex: newIndex));
      await audioService.seek(Duration.zero);
      await _loadChant(chant);
      play();
      logger.t('Moved to next chant index $newIndex');
    }
  }

  @override
  Future<void> close() {
    _gapTimerService?.close();
    _positionSubscription?.cancel();
    _playbackStateSubscription?.cancel();
    audioService.release();
    return super.close();
  }
  
}
