import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:logger/logger.dart';
import 'package:dhyana/enum/sound.dart';
import 'package:dhyana/util/all.dart';

import 'audio_service.dart';

class DefaultAudioService implements AudioService {

  final Logger logger = getLogger('DefaultAudioService');
  AudioPlayer audioPlayer = AudioPlayer();

  DefaultAudioService() {
    audioPlayer.setPlayerMode(PlayerMode.lowLatency);
    audioPlayer.setReleaseMode(ReleaseMode.stop);
  }

  @override
  Future<void> play(Sound sound) async {
    // Need to stop the audio player, because in case its already playing the
    // same sound, it will not play the same sound again.
    if (audioPlayer.state == PlayerState.playing) {
      await audioPlayer.stop();
    }
    logger.t('Playing sound: ${sound.name} ${sound.audioResourcePath}');
    return audioPlayer.play(AssetSource(sound.audioResourcePath));
  }

  @override
  void close() {
    audioPlayer.dispose();
  }

}
