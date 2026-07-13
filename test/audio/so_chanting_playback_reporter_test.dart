import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:dhyana/audio/so_chanting_playback_reporter.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeTimer implements Timer {
  FakeTimer(this._onTick);

  final void Function(Timer timer) _onTick;

  var _isActive = true;
  var _tick = 0;

  @override
  bool get isActive => _isActive;

  @override
  int get tick => _tick;

  @override
  void cancel() {
    _isActive = false;
  }

  void fire() {
    if (!_isActive) {
      return;
    }
    _tick++;
    _onTick(this);
  }
}

void main() {
  group('SoLoudSoChantingPlaybackReporter', () {
    test('emits periodic current state through the timer', () {
      final states = <PlaybackState>[];
      FakeTimer? timer;
      final reporter = SoLoudSoChantingPlaybackReporter(
        playbackStateSink: states.add,
        positionProvider: () => const Duration(seconds: 5),
        playingProvider: () => false,
        queueIndexProvider: () => 3,
        timerFactory: (duration, callback) {
          timer = FakeTimer(callback);
          return timer!;
        },
      );

      reporter.start();
      expect(timer, isNotNull);
      expect(timer!.isActive, isTrue);
      expect(states, isEmpty);

      timer!.fire();

      expect(states, hasLength(1));
      expect(states.single.processingState, AudioProcessingState.idle);
      expect(states.single.playing, isFalse);
      expect(states.single.queueIndex, 3);
      expect(states.single.updatePosition, const Duration(seconds: 5));
    });

    test('emitLoading and emitStopped publish the expected playback states', () {
      final states = <PlaybackState>[];
      final reporter = SoLoudSoChantingPlaybackReporter(
        playbackStateSink: states.add,
        positionProvider: () => Duration.zero,
        playingProvider: () => false,
        queueIndexProvider: () => null,
      );

      reporter.emitLoading();
      reporter.emitStopped();

      expect(states, hasLength(2));
      expect(states[0].processingState, AudioProcessingState.loading);
      expect(states[0].controls, isEmpty);
      expect(states[1].processingState, AudioProcessingState.idle);
      expect(states[1].controls, [MediaControl.play]);
    });

    test('emitCompleted cancels the timer and publishes completion state', () {
      final states = <PlaybackState>[];
      FakeTimer? timer;
      final reporter = SoLoudSoChantingPlaybackReporter(
        playbackStateSink: states.add,
        positionProvider: () => Duration.zero,
        playingProvider: () => false,
        queueIndexProvider: () => 7,
        timerFactory: (duration, callback) {
          timer = FakeTimer(callback);
          return timer!;
        },
      );

      reporter.start();
      expect(timer!.isActive, isTrue);

      reporter.emitCompleted();

      expect(timer!.isActive, isFalse);
      expect(states, hasLength(1));
      expect(states.single.processingState, AudioProcessingState.completed);
      expect(states.single.queueIndex, 7);
      expect(states.single.controls, [MediaControl.play]);
    });
  });
}
