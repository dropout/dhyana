import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:dhyana/enum/playback_state.dart';
import 'package:dhyana/util/duration.dart';
import 'package:dhyana/util/logger_mixin.dart';
import 'package:dhyana/enum/sound.dart';

import '../audio_service.dart';

/// Default implementation of the AudioService using the audioplayers package. 
class DefaultAudioService with LoggerMixin implements AudioService {

  /// The audio player instance used to play sounds.
  final AudioPlayer audioPlayer = AudioPlayer();

  /// Creates a new instance of the DefaultAudioService and configures the audio player.
  DefaultAudioService() {
    audioPlayer.setPlayerMode(PlayerMode.lowLatency);
    audioPlayer.setReleaseMode(ReleaseMode.stop);
  }

  /// Plays the specified sound. If the sound is `Sound.none`, it will not play anything.
  @override
  Future<void> playSound(Sound sound) async {
    if (sound == Sound.none) {
      logger.t('No sound to play');
      return;
    }

    // Need to stop the audio player, because in case its already playing the
    // same sound, it will not play the same sound again.
    if (audioPlayer.state == PlayerState.playing) {
      await audioPlayer.stop();
    }
    logger.t('Playing sound: ${sound.name} ${sound.audioResourcePath}');
    return audioPlayer.play(AssetSource(sound.audioResourcePath));
  }

  /// Loads the audio resource from the network or from the local file system. 
  /// This is used for preloading sounds before playing them.
  @override
  Future<Duration?> loadFromUrl(String url) async {
    await audioPlayer.setSourceUrl(url);
    return audioPlayer.getDuration();
  }

  /// Returns whether the audio player is currently playing a sound.
  @override
  bool get isPlaying {
    return audioPlayer.state == PlayerState.playing;
  }

  /// Returns a stream that emits whether the audio player 
  /// is currently playing a sound.
  @override
  Stream<bool> get isPlayingStream =>
    audioPlayer.onPlayerStateChanged
      .map((state) => (state == PlayerState.playing));

  /// Plays the currently loaded sound, if any.
  @override
  Future<void> play() {
    logger.t('Play audio');
    return audioPlayer.resume();
  }

  /// Pauses the currently playing sound, if any.
  @override
  Future<void> pause() {
    logger.t('Pause audio');
    return audioPlayer.pause();
  }

  /// Seeks the currently playing sound to the specified position.
  @override
  Future<void> seek(Duration position) {
    logger.t('Seek audio to position: ${position.formatHHMMSSmm()} seconds');
    return audioPlayer.seek(position);
  }

  /// Stops the currently playing sound, if any.
  @override
  Future<void> stop() {
    logger.t('Stop playback');
    return audioPlayer.stop();
  }

  @override
  Future<void> release() {
    logger.t('Release audio player resources');
    return audioPlayer.release();
  }

  /// Disposes the audio player when the service is closed.
  @override
  void close() {
    audioPlayer.dispose();
  }
  
  /// Returns a stream that emits the current position of the audio player.
  @override
  Stream<Duration> get positionStream => audioPlayer.onPositionChanged;
  
  /// Returns a stream that emits the current playback state of the audio player.
  @override
  Stream<PlaybackState> get playbackStateStream => 
    audioPlayer.onPlayerStateChanged.map((state) => state.toPlaybackState());

  /// Returns a stream that emits an event when the audio 
  /// player has completed playing a sound.
  @override
  Stream<void> get onCompletedStream => audioPlayer.onPlayerComplete;

}

/// Extension method to decouple PlayerState from the 
/// audioplayers package to domain PlaybackState used in the application.
extension DefaultPlaybackStateExtension on PlayerState {
  PlaybackState toPlaybackState() {
    return switch (this) {
      PlayerState.stopped => PlaybackState.stopped,
      PlayerState.playing => PlaybackState.playing,
      PlayerState.paused => PlaybackState.paused,
      PlayerState.completed => PlaybackState.completed,
      PlayerState.disposed => PlaybackState.disposed,
    };
  }
}
