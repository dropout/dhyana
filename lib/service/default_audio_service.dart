import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:dhyana/enum/sound.dart';
import 'package:dhyana/util/all.dart';

import 'audio_service.dart';

class DefaultAudioService implements AudioService {

  Logger logger = getLogger('DefaultAudioService');
  AudioPlayer audioPlayer = AudioPlayer();

  DefaultAudioService() {
    audioPlayer.setPlayerMode(PlayerMode.lowLatency);
  }

  @override
  Future<void> play(Sound sound) {
    logger.v('Playing sound: ${describeEnum(sound)} ${sound.audioResourcePath}');
    return audioPlayer.play(AssetSource(sound.audioResourcePath));
  }

  @override
  void close() {
    audioPlayer.dispose();
  }

}
