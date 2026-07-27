import 'package:audio_service/audio_service.dart';
import 'package:dhyana/core/domain/enum/sound.dart';
import 'package:dhyana/modules/practice/timer/domain/entity/timer_settings.dart';

abstract interface class TimerAudioService {

  Future<void> playSound(Sound sound);
  Future<void> start(TimerSettings timerSettings);
  Future<void> pause();
  Future<void> resume();
  Future<void> stop();

  bool get isPlaying;
  Stream<bool> get isPlayingStream;

  Stream<PlaybackState> get playbackStateStream;

}