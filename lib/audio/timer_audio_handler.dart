import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:dhyana/enum/sound.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/util/logger_mixin.dart';

enum TimerHandlerCustomAction { setup, playSound, updatePosition, release }

/// Custom [AudioHandler] that manages audio for the timer session, including
/// maintaining an active media session for background execution and lock screen
/// integration, as well as playing discrete sounds for timer cues.

/// It also servers as a source of truth for the timer.
class TimerAudioHandler extends BaseAudioHandler with LoggerMixin {
  
  static const handlerId = 'TimerAudioHandler';
  static const tickInterval = Duration(milliseconds: 250);

  /// This player is used to maintain an active media session with the OS,
  /// which is necessary for background execution and lock screen to work.
  final AudioPlayer _backgroundPlayer = AudioPlayer();

  /// This player is used for playing discrete sounds (e.g. bell sounds) without
  /// affecting the OS media session, which is necessary to avoid unintended
  /// side effects like pausing music playback when a bell sound is played.
  final AudioPlayer _audioPlayer = AudioPlayer();

  StreamSubscription<PlayerState>? _playerStateSubscription;
  StreamSubscription<Duration>? _playerPositionSubscription;

  TimerAudioHandler() {
    // Configure background player for the timer session.
    _backgroundPlayer.positionUpdater = TimerPositionUpdater(
      interval: tickInterval,
      getPosition: _backgroundPlayer.getCurrentPosition,
    );
    _backgroundPlayer.setPlayerMode(.mediaPlayer);
    _backgroundPlayer.setReleaseMode(.loop);

    _playerStateSubscription = _backgroundPlayer.onPlayerStateChanged
      .listen(_onPlayerStateChanged);

    _playerPositionSubscription = _backgroundPlayer.onPositionChanged
      .listen((p) => playbackState.add(
        playbackState.value.copyWith(updatePosition: p))
      );


    // Configure audio player for discrete sounds.
    // Keep .mediaPlayer mode so that on android we will also have an o
    // oncomplete event
    _audioPlayer.setPlayerMode(.mediaPlayer);
    _audioPlayer.setReleaseMode(.stop);
  }

  // TODO: Revisit error handling in this class.
  @override
  Future<dynamic> customAction(
    String name, [
    Map<String, dynamic>? extras,
  ]) async {
    // Parse the custom into corresponding enum value
    final action = TimerHandlerCustomAction.values.firstWhere(
      (e) => e.name == name,
      orElse: () => throw UnimplementedError('Unknown custom action: $name'),
    );

    // Handle the custom action based on the parsed enum value
    switch (action) {
      case TimerHandlerCustomAction.setup:
        try {
          final timerSettings = TimerSettings.fromJson(extras!);
          return _setupSession(timerSettings);
        } catch (e) {
          throw ArgumentError(
            'Invalid timer settings for setup action: $extras',
          );
        }
      case TimerHandlerCustomAction.playSound:
        try {
          final soundValue = extras!['sound'] as String;
          final sound = Sound.values.firstWhere(
            (s) => s.name == soundValue,
            orElse: () =>
              throw ArgumentError('Unknown sound value: $soundValue'),
          );
          return _playSound(sound);
        } catch (e) {
          throw ArgumentError('Invalid sound for playSound action: $extras');
        }
      case TimerHandlerCustomAction.updatePosition:
        try {
          final positionInMilliseconds =
            extras!['positionInMilliseconds'] as int;
          return _updateTimerPosition(
            Duration(milliseconds: positionInMilliseconds),
          );
        } catch (e) {
          throw ArgumentError(
            'Invalid position for updatePosition action: $extras',
          );
        }
      case TimerHandlerCustomAction.release:
        mediaItem.add(null);
        playbackState.add(
          PlaybackState(
            controls: [],
            systemActions: const {},
            androidCompactActionIndices: const [],
          ),
        );
        // Only release the background player, which is responsible 
        // for maintaining the OS media session.
        // Do not release the audio player, which is responsible for playing discrete
        // sounds, so that when the route changes to show a completed session
        // the ending sound can still play without being cut off by the audio player.
        _backgroundPlayer.release();
        return;
    }
  }

  @override
  Future<void> play() async {
    _backgroundPlayer.resume();
    playbackState.add(
      playbackState.value.copyWith(
        playing: true,
        processingState: AudioProcessingState.ready,
        controls: [],
        systemActions: const {},
      ),
    );
  }

  @override
  Future<void> pause() async {
    _backgroundPlayer.pause();
    playbackState.add(
      playbackState.value.copyWith(
        playing: false,
        processingState: AudioProcessingState.ready,
        controls: [],
      ),
    );
  }

  @override
  stop() async {
    _backgroundPlayer.stop();
    playbackState.add(
      playbackState.value.copyWith(
        playing: false,
        processingState: AudioProcessingState.idle,
        controls: [],
      ),
    );
  }

  Future<void> _setupSession(TimerSettings timerSettings) async {
    mediaItem.add(
      MediaItem(
        id: DateTime.now().toIso8601String(),
        title: 'Timer Session',
        artist: 'Dhyana App',
        album: 'Current Timer Session',
        duration: timerSettings.totalTime,
        artUri: Uri.parse(
          'https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg',
        ),
      ),
    );
    await _backgroundPlayer.setSource(
      AssetSource(Sound.none.audioResourcePath),
    );
  }

  /// Plays a discrete bell sound using the low-latency player.
  /// Does not affect the OS media session.
  Future<void> _playSound(Sound sound) async {
    if (sound == Sound.none) return;

    if (_audioPlayer.state == PlayerState.playing) {
      await _audioPlayer.stop();
    }

    await _audioPlayer.play(AssetSource(sound.audioResourcePath));
    await _audioPlayer.onPlayerComplete.first;
  }

  Future<void> _updateTimerPosition(Duration position) async {
    playbackState.add(playbackState.value.copyWith(updatePosition: position));
    logger.t(
      'Updated timer position: $position Duration: ${mediaItem.value?.duration}',
    );
  }

  void _onPlayerStateChanged(PlayerState state) {
    final isNowPlaying = (state == PlayerState.playing);
    playbackState.add(
      playbackState.value.copyWith(
        controls: [isNowPlaying ? MediaControl.pause : MediaControl.play],
        systemActions: const {},
        processingState: _toProcessingState(state),
        playing: isNowPlaying,
      ),
    );
  }

  AudioProcessingState _toProcessingState(PlayerState state) => switch (state) {
    PlayerState.playing => AudioProcessingState.ready,
    PlayerState.paused => AudioProcessingState.ready,
    PlayerState.stopped => AudioProcessingState.idle,
    PlayerState.completed => AudioProcessingState.completed,
    PlayerState.disposed => AudioProcessingState.idle,
  };


  @override
  Future<void> click([MediaButton button = MediaButton.media]) async {
    // ovveride BaseAudioHandler.click to disable functionality
    // added there.
    // Timer Audio Handler does not need to react to bluetooth
    // and headphone controller button clicks just yet
  }

  void close() {
    _playerStateSubscription?.cancel();
    _playerStateSubscription = null;
    _playerPositionSubscription?.cancel();
    _playerPositionSubscription = null;
    _backgroundPlayer.dispose();
    _audioPlayer.dispose();
  }
  
}
