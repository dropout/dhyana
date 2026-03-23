import 'dart:async';

import 'package:dhyana/enum/playback_state.dart';
import 'package:dhyana/enum/sound.dart';

abstract interface class AudioService {

  Future<void> playSound(Sound sound);
  Future<Duration?> loadFromUrl(String url);
  Future<void> play();
  Future<void> pause();
  Future<void> seek(Duration position);
  Future<void> stop();
  Future<void> release();
  bool get isPlaying;
  Stream<bool> get isPlayingStream;
  Stream<Duration> get positionStream;
  Stream<PlaybackState> get playbackStateStream;
  Stream<void> get onCompletedStream;
  void close();

}
