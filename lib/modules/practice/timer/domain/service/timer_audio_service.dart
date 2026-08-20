import 'package:dhyana/core/domain/enum/sound.dart';
import 'package:dhyana/modules/practice/timer/domain/entity/playback_state_entity.dart';
import 'package:dhyana/modules/practice/timer/domain/entity/timer_settings_entity.dart';


/// An interface for a service that manages audio playback for a timer application.
abstract interface class TimerAudioService {

  Future<void> playSound(Sound sound);
  Future<void> start(TimerSettingsEntity timerSettings);
  Future<void> pause();
  Future<void> resume();
  Future<void> stop();

  bool get isPlaying;
  Stream<bool> get isPlayingStream;

  Stream<PlaybackStateEntity> get playbackStateStream;

}