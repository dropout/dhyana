import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';
import 'package:dhyana/enum/sound.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/util/logger_mixin.dart';

/// Enum representing custom actions that the [TimerAudioHandler] can handle.
enum TimerHandlerCustomAction { start, playSound }

/// Custom [AudioHandler] that manages audio for the timer session, including
/// maintaining an active media session for background execution and lock screen
/// integration, as well as playing discrete sounds for timer cues.
/// It also servers as a source of truth for the timer.
class TimerAudioHandler extends BaseAudioHandler with LoggerMixin {
  static const handlerId = 'TimerAudioHandler';

  /// This player is used to maintain an active media session with the OS,
  /// which is necessary for background execution and lock screen to work.
  final AudioPlayer _backgroundPlayer = AudioPlayer();

  /// This player is used for playing discrete sounds (e.g. bell sounds) without
  /// affecting the OS media session, which is necessary to avoid unintended
  /// side effects like pausing music playback when a bell sound is played.
  final AudioPlayer _soundPlayer = AudioPlayer();

  StreamSubscription<PlayerState>? _bgPlayerStateSub;
  StreamSubscription<Duration>? _bgPlayerPositionSub;

  DateTime? _lastPositionUpdateTime;
  Duration _sessionDuration = Duration.zero;

  TimerAudioHandler() {
    // Configure background player for the timer session.
    _backgroundPlayer.setLoopMode(LoopMode.one);
    _bgPlayerStateSub = _backgroundPlayer.playerStateStream.listen(
      _onBgPlayerStateChanged,
    );

    _bgPlayerPositionSub = _backgroundPlayer.positionStream.listen(
      _onPositionChanged,
    );
  }

  // TODO: Revisit error handling in this class.
  @override
  Future<dynamic> customAction(
    String name, [
    Map<String, dynamic>? extras,
  ]) async {
    // Parse the custom action string into corresponding enum value
    final action = TimerHandlerCustomAction.values.firstWhere(
      (e) => e.name == name,
      orElse: () => throw UnimplementedError('Unknown custom action: $name'),
    );

    // Handle the custom action based on the parsed enum value
    switch (action) {
      case TimerHandlerCustomAction.start:
        try {
          final timerSettings = TimerSettings.fromJson(extras!);
          return _start(timerSettings);
        } catch (e) {
          throw ArgumentError(
            'Invalid timer settings for start action: $extras',
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
      // case TimerHandlerCustomAction.release:
      //   mediaItem.add(null);
      //   playbackState.add(
      //     PlaybackState(
      //       controls: [],
      //       systemActions: const {},
      //       androidCompactActionIndices: const [],
      //     ),
      //   );
      //   // Only release the background player, which is responsible
      //   // for maintaining the OS media session.
      //   // Do not release the audio player, which is responsible for playing discrete
      //   // sounds, so that when the route changes to show a completed session
      //   // the ending sound can still play without being cut off by the audio player.
      //   await _backgroundPlayer.stop();
      //   return;
    }
  }

  @override
  Future<void> play() async {
    _lastPositionUpdateTime = DateTime.now();
    _backgroundPlayer.play();
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
    await _backgroundPlayer.pause();
    playbackState.add(
      playbackState.value.copyWith(
        playing: false,
        processingState: AudioProcessingState.ready,
      ),
    );
  }

  @override
  stop() async {    
    await _backgroundPlayer.stop();
    playbackState.add(
      playbackState.value.copyWith(
        playing: false,
        processingState: AudioProcessingState.idle,
      ),
    );
  }

  Future<void> _start(TimerSettings timerSettings) async {
    // Set the source for background player to a silent audio asset,
    // which will keep the media session active
    await _backgroundPlayer.setAsset(Sound.none.audioResourcePath);

    // Configure lock screen media info
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

    _lastPositionUpdateTime = DateTime.now();
    _sessionDuration = Duration.zero;
    play();
    playbackState.add(
      playbackState.value.copyWith(
        playing: true,
        processingState: AudioProcessingState.ready,
        controls: [],
        systemActions: const {},
      ),
    );
  }

  /// Plays a discrete bell sounds using a dedicated audio player.
  /// Does not affect the OS media session.
  Future<void> _playSound(Sound sound) async {
    if (sound == Sound.none) return;

    if (_soundPlayer.playing) {
      await _soundPlayer.stop();
    }

    await _soundPlayer.setAsset(sound.audioResourcePath);
    if (_backgroundPlayer.playing == false) {
      playbackState.add(
        playbackState.value.copyWith(
          processingState: AudioProcessingState.ready,
          playing: true,
        ),
      );
    }
    await _soundPlayer.play();
    if (_backgroundPlayer.playing == false) {
      playbackState.add(
        playbackState.value.copyWith(
          processingState: AudioProcessingState.idle,
          playing: false,
        ),
      );
    }
  }

  void _onBgPlayerStateChanged(PlayerState state) {
    logger.t('Background player state changed: $state');
    // Ignore .completed state from the background player,
    // because it's looping and will emit .completed after each loop,
    // which would cause side effects if we treated it as a real completed state.
    if (state.processingState == ProcessingState.completed) return;

    playbackState.add(
      playbackState.value.copyWith(
        systemActions: const {},
        processingState: _toProcessingState(state),
        playing: state.playing,
      ),
    );
  }

  void _onPositionChanged(Duration position) {
    final n = DateTime.now();
    if (_lastPositionUpdateTime == null) {
      _lastPositionUpdateTime = n;
    } else {
      final diff = n.difference(_lastPositionUpdateTime!);
      _sessionDuration += diff;
      playbackState.add(
        playbackState.value.copyWith(updatePosition: _sessionDuration),
      );
      _lastPositionUpdateTime = n;
    }
    logger.t('Session duration: $_sessionDuration');
  }

  AudioProcessingState _toProcessingState(PlayerState state) => switch (state) {
    PlayerState(processingState: ProcessingState.idle) =>
      AudioProcessingState.idle,
    PlayerState(processingState: ProcessingState.loading) =>
      AudioProcessingState.loading,
    PlayerState(processingState: ProcessingState.buffering) =>
      AudioProcessingState.loading,
    PlayerState(processingState: ProcessingState.ready) =>
      AudioProcessingState.ready,
    PlayerState(processingState: ProcessingState.completed) =>
      AudioProcessingState.completed,
  };

  @override
  Future<void> click([MediaButton button = MediaButton.media]) async {
    // ovveride BaseAudioHandler.click to disable functionality
    // added there.
    // Timer Audio Handler does not need to react to bluetooth
    // and headphone controller button clicks just yet
  }

  void close() {
    _bgPlayerStateSub?.cancel();
    _bgPlayerStateSub = null;
    _bgPlayerPositionSub?.cancel();
    _bgPlayerPositionSub = null;
    _lastPositionUpdateTime = null;

    _backgroundPlayer.dispose();
    _soundPlayer.dispose();
  }
  
}
