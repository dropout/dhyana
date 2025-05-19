import 'dart:async';

import 'package:dhyana/enum/sound.dart';

abstract class AudioService  {

  Future<void> play(Sound sound);
  Future<void> stop();
  bool get isPlaying;
  Stream<bool> get isPlayingStream;
  void close();

}
