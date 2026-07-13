import 'dart:async';

import 'package:audio_service/audio_service.dart';

typedef SoChantingPeriodicTimerFactory = Timer Function(
  Duration duration,
  void Function(Timer timer) callback,
);

abstract interface class SoChantingPlaybackReporter {
  void start();

  void stop();

  void emitLoading();

  void emitStopped();

  void emitCompleted();

  void emitCurrentState();
}

class SoLoudSoChantingPlaybackReporter implements SoChantingPlaybackReporter {
  final void Function(PlaybackState) playbackStateSink;
  final Duration Function() positionProvider;
  final bool Function() playingProvider;
  final int? Function() queueIndexProvider;
  final SoChantingPeriodicTimerFactory timerFactory;

  Timer? _timer;

  SoLoudSoChantingPlaybackReporter({
    required this.playbackStateSink,
    required this.positionProvider,
    required this.playingProvider,
    required this.queueIndexProvider,
    SoChantingPeriodicTimerFactory? timerFactory,
  }) : timerFactory = timerFactory ?? Timer.periodic;

  @override
  void start() {
    stop();
    _timer = timerFactory(
      const Duration(milliseconds: 64),
      (_) => emitCurrentState(),
    );
  }

  @override
  void stop() {
    _timer?.cancel();
    _timer = null;
  }

  @override
  void emitLoading() {
    playbackStateSink(
      PlaybackState(
        controls: [],
        processingState: AudioProcessingState.loading,
        playing: false,
        updatePosition: Duration.zero,
      ),
    );
  }

  @override
  void emitStopped() {
    playbackStateSink(
      PlaybackState(
        controls: [MediaControl.play],
        processingState: AudioProcessingState.idle,
        playing: false,
        updatePosition: Duration.zero,
      ),
    );
  }

  @override
  void emitCompleted() {
    stop();
    playbackStateSink(
      PlaybackState(
        controls: [MediaControl.play],
        processingState: AudioProcessingState.completed,
        playing: false,
        queueIndex: queueIndexProvider(),
        updatePosition: Duration.zero,
      ),
    );
  }

  @override
  void emitCurrentState() {
    final playing = playingProvider();
    playbackStateSink(
      PlaybackState(
        controls: [playing ? MediaControl.pause : MediaControl.play],
        systemActions: const {},
        processingState: playing
            ? AudioProcessingState.ready
            : AudioProcessingState.idle,
        playing: playing,
        queueIndex: queueIndexProvider(),
        updatePosition: positionProvider(),
      ),
    );
  }
}