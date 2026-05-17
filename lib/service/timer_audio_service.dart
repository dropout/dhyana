import 'package:audio_service/audio_service.dart';
import 'package:dhyana/audio/app_audio_handler.dart';
import 'package:dhyana/audio/so_timer_audio_handler.dart';
import 'package:dhyana/enum/sound.dart';
import 'package:dhyana/model/timer_settings.dart';

/// Service that provides timer-specific audio functionality by delegating to
/// the [AppAudioHandler] with appropriate custom actions.
class TimerAudioService {
  
  /// The [AppAudioHandler] that this service uses to control audio playback.
  final AppAudioHandler _audioHandler;

  /// Creates a [TimerAudioService] that uses the given [AppAudioHandler].
  /// Upon initialization, it sends a custom action to the [AppAudioHandler] to
  /// switch to the [TimerAudioHandler] for handling timer-related audio actions.
  TimerAudioService(this._audioHandler) {
    _switchToTimerAudioHandler();
  }

  /// Plays the specified [sound] by sending a custom action to the [AppAudioHandler].
  Future<void> playSound(Sound sound) =>
    _audioHandler.customAction(SoTimerHandlerCustomAction.playSound.name, {
      'sound': sound.name,
    });
  
  /// Starts the timer with the given [timerSettings] by sending a custom action to the [AppAudioHandler].  
  Future<void> start(TimerSettings timerSettings) =>
    _audioHandler.customAction(SoTimerHandlerCustomAction.start.name, timerSettings.toJson());

  /// Resumes audio playback by delegating to the [AppAudioHandler]'s play method.
  Future<void> resume() =>
    _audioHandler.play();

  /// Pauses audio playback by delegating to the [AppAudioHandler]'s pause method.
  Future<void> pause() =>
    _audioHandler.pause();
  
  /// Stops audio playback by delegating to the [AppAudioHandler]'s stop method.
  /// This method will release resources and reset the playback state, 
  /// effectively stopping any ongoing timer audio.
  Future<void> stop() =>
    _audioHandler.stop();
    
  bool get isPlaying => _audioHandler.playbackState.value.playing;

  Stream<bool> get isPlayingStream =>
    _audioHandler.playbackState.map((state) => state.playing);

  Stream<PlaybackState> get playbackStateStream 
    => _audioHandler.playbackState;

  void _switchToTimerAudioHandler() => 
    _audioHandler.customAction(AppAudioHandler.switchAction, {
      'handlerId': SoTimerAudioHandler.handlerId,
    });
    
}
