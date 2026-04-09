import 'package:audio_service/audio_service.dart';
import 'package:dhyana/audio/app_audio_handler.dart';
import 'package:dhyana/audio/timer_audio_handler.dart';
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
    _audioHandler.customAction(TimerHandlerCustomAction.playSound.name, {
      'sound': sound.name,
    });

  /// Sets up the audio session for the timer with the given [timerSettings].
  /// This should be called before starting the timer to ensure that the audio
  /// session is properly configured for background execution and 
  /// lock screen data display (e.g., total length of the session).
  Future<void> setupSession(TimerSettings timerSettings) =>
    _audioHandler.customAction(
      TimerHandlerCustomAction.setup.name, 
      timerSettings.toJson()
    );
  
  /// Does not play sound, just instructs the handler to initiate an
  /// OS-level media session, which is necessary for background execution and
  /// lock screen controls to work properly.
  Future<void> start() =>
    _audioHandler.play();

  Future<void> resume() =>
    _audioHandler.play();

  Future<void> pause() =>
    _audioHandler.pause();
  
  Future<void> stop() =>
    _audioHandler.stop();
  
  Future<void> release() =>
    _audioHandler.customAction(TimerHandlerCustomAction.release.name);

  Future<void> updatePosition(Duration position) =>
    _audioHandler.customAction(TimerHandlerCustomAction.updatePosition.name, {
      'positionInMilliseconds': position.inMilliseconds,
    });
  
  bool get isPlaying => _audioHandler.playbackState.value.playing;

  Stream<bool> get isPlayingStream =>
    _audioHandler.playbackState.map((state) => state.playing);

  Stream<PlaybackState> get playbackStateStream => _audioHandler.playbackState;

  void _switchToTimerAudioHandler() => 
    _audioHandler.customAction(AppAudioHandler.switchAction, {
      'handlerId': TimerAudioHandler.handlerId,
    });
    
}
