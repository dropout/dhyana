import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:dhyana/enum/sound.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/util/logger_mixin.dart';

enum TimerHandlerCustomAction { setup, playSound, updatePosition, release }

class TimerAudioHandler extends BaseAudioHandler with LoggerMixin {
  static const handlerId = 'TimerAudioHandler';

  final AudioPlayer _backgroundPlayer = AudioPlayer();
  final AudioPlayer _audioPlayer = AudioPlayer();

  TimerAudioHandler() {
    _backgroundPlayer.setPlayerMode(.mediaPlayer);
    _backgroundPlayer.setReleaseMode(.loop);

    _audioPlayer.setPlayerMode(.lowLatency);
    _audioPlayer.setReleaseMode(.stop);
  }

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
        return _audioPlayer.release();
    }
  }

  @override
  Future<void> play() async {
    logger.t('Play');
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
        duration: (timerSettings.duration + timerSettings.warmup),
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

    return _audioPlayer.play(AssetSource(sound.audioResourcePath));
  }

  Future<void> _updateTimerPosition(Duration position) async {
    playbackState.add(playbackState.value.copyWith(updatePosition: position));
    logger.t(
      'Updated timer position: $position Duration: ${mediaItem.value?.duration}',
    );
  }

  @override
  Future<void> click([MediaButton button = MediaButton.media]) async {
    // ovveride BaseAudioHandler.click to disable functionality
    // added there.
    // Timer Audio Handler does not need to react to bluetooth
    // and headphone controller button clicks just yet
  }

  void close() {
    _backgroundPlayer.dispose();
    _audioPlayer.dispose();
  }

}
