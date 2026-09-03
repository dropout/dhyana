import 'dart:async';
import 'dart:io';

import 'package:core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:audio_service/audio_service.dart';
import 'package:audio_session/audio_session.dart';

import 'package:chanting/chanting.dart';
import 'package:timer/timer.dart';

/// The main audio handler for the app that manages switching
/// between different audio handlers
class DefaultAppAudioHandler extends SwitchAudioHandler
    implements AppAudioHandler {
  /// The action name for switching audio handlers.
  static const switchAction = 'switchToHandler';

  /// The [SoLoudChantingAudioHandler] that handles chanting-related audio
  /// actions using flutter_soloud.
  final SoLoudChantingAudioHandler _soLoudChantingAudioHandler;

  /// The [SoTimerAudioHandler] that handles timer-related audio actions.
  final SoTimerAudioHandler _timerAudioHandler;

  /// Creates an [DefaultAppAudioHandler] that initializes with the [SoTimerAudioHandler]
  /// as the default handler.
  DefaultAppAudioHandler(
    this._timerAudioHandler,
    this._soLoudChantingAudioHandler,
  ) : super(_timerAudioHandler);

  Future<Duration> get outputLatency async {
    if (Platform.isIOS) {
      return AVAudioSession().outputLatency;
    } else {
      return Duration.zero;
    }
  }

  /// Overrides the [customAction] method to handle switching between audio
  /// handlers based on the received custom action. When a `switchToHandler`
  /// action is received, it checks the `handlerId` in the extras to determine
  /// which handler to switch to and updates the `inner` handler accordingly.
  /// Any other custom actions are passed to the superclass implementation.
  @override
  Future<dynamic> customAction(
    String name, [
    Map<String, dynamic>? extras,
  ]) async {
    switch (name) {
      case switchAction:
        stop(); // stop everything that is ongoing
        String handlerId = extras!['handlerId'] as String;

        if (handlerId == SoLoudChantingAudioHandler.handlerId) {
          inner = _soLoudChantingAudioHandler;
        }

        if (handlerId == SoTimerAudioHandler.handlerId) {
          inner = _timerAudioHandler;
        }

        debugPrint('Switched to $handlerId');
        return null;
      default:
        return super.customAction(name, extras);
    }
  }

  @override
  void switchToTimerAudioHandler() {
    customAction(switchAction, {'handlerId': SoTimerAudioHandler.handlerId});
  }

  @override
  void switchToChantingAudioHandler() {
    customAction(switchAction, {'handlerId': SoLoudChantingAudioHandler.handlerId});
  }

  /// Closes all audio handlers when the app audio handler is closed.
  void close() {
    _soLoudChantingAudioHandler.close();
    _timerAudioHandler.close();
  }
}
