import 'package:flutter/services.dart';
import 'package:gaimon/gaimon.dart';

import 'package:core/core.dart';
import 'package:timer/src/audio/so_timer_audio_handler.dart';
import 'package:timer/src/data/mapper/playback_state_mapper.dart';
import 'package:timer/src/data/mapper/timer_settings_mapper.dart';
import 'package:timer/src/domain/entity/playback_state_entity.dart';
import 'package:timer/src/domain/entity/timer_settings_entity.dart';
import 'package:timer/src/domain/service/timer_audio_service.dart';


/// A timer service that measures time based on audio playback. 
/// It uses an [AppAudioHandler] to control audio playback and 
/// manage timer-related actions.
class DefaultTimerAudioService implements TimerAudioService {
  
  /// The [AppAudioHandler] that this service uses to control audio playback.
  final AppAudioHandler _audioHandler;

  /// Creates a [DefaultTimerAudioService] that uses the given [AppAudioHandler].
  /// Upon initialization, it sends a custom action to the [AppAudioHandler] to
  /// switch to the [TimerAudioHandler] for handling timer-related audio actions.
  DefaultTimerAudioService(this._audioHandler) {
    _switchToTimerAudioHandler();
  }

  /// Plays the specified [sound] by sending a custom action to the [AppAudioHandler].
  @override
  Future<void> playSound(Sound sound) =>
    switch (sound.type) {
      SoundType.audio => _playAudioSound(sound),
      SoundType.haptic => _playHapticSound(sound),
    };
  
  /// Starts the timer with the given [timerSettings] by sending a custom action to the [AppAudioHandler].
  @override
  Future<void> start(TimerSettingsEntity timerSettings) =>
    _audioHandler.customAction(SoTimerHandlerCustomAction.start.name, timerSettings.toApi().toJson());

  /// Resumes audio playback by delegating to the [AppAudioHandler]'s play method.
  @override
  Future<void> resume() =>
    _audioHandler.play();

  /// Pauses audio playback by delegating to the [AppAudioHandler]'s pause method.
  @override
  Future<void> pause() =>
    _audioHandler.pause();
  
  /// Stops audio playback by delegating to the [AppAudioHandler]'s stop method.
  /// This method will release resources and reset the playback state, 
  /// effectively stopping any ongoing timer audio.
  @override
  Future<void> stop() =>
    _audioHandler.stop();
    
  @override
  bool get isPlaying => _audioHandler.playbackState.value.playing;

  @override
  Stream<bool> get isPlayingStream =>
    _audioHandler.playbackState.map((state) => state.playing);

  @override
  Stream<PlaybackStateEntity> get playbackStateStream 
    => _audioHandler.playbackState.map((state) => state.toDomain());

  void _switchToTimerAudioHandler() => 
    _audioHandler.switchToTimerAudioHandler();
  
  Future<void> _playAudioSound(Sound sound) {
    return _audioHandler.customAction(SoTimerHandlerCustomAction.playSound.name, {
      'sound': sound.name,
    });
  }

  Future<void> _playHapticSound(Sound sound) async {
    final String response = await rootBundle
      .loadString(sound.assetPath);
    Gaimon.patternFromData(response);
  }

}
