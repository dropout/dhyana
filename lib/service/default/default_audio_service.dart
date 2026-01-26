import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:dhyana/util/logger_mixin.dart';
import 'package:dhyana/enum/sound.dart';
import 'package:dhyana/util/all.dart';

import '../audio_service.dart';

class DefaultAudioService with LoggerMixin implements AudioService {

  AudioPlayer audioPlayer = AudioPlayer();

  DefaultAudioService() {
    audioPlayer.setPlayerMode(PlayerMode.lowLatency);
    audioPlayer.setReleaseMode(ReleaseMode.stop);
  }

  @override
  Future<void> play(Sound sound) async {
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

  @override
  bool get isPlaying {
    return audioPlayer.state == PlayerState.playing;
  }

  @override
  Stream<bool> get isPlayingStream {
    return audioPlayer.onPlayerStateChanged.map((state) => state == PlayerState.playing);
  }

  @override
  Future<void> stop() {
    logger.t('Stopping sound');
    return audioPlayer.stop();
  }

  @override
  void close() {
    audioPlayer.dispose();
  }

}
