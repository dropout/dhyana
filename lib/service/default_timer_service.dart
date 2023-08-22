import 'dart:async';

import 'package:logger/logger.dart';
import 'package:dhyana/service/timer_service.dart';
import 'package:dhyana/util/logger_factory.dart';

class DefaultTimerService implements TimerService {

  final Logger logger = getLogger('DefaultTimerService');
  final Duration duration;
  final int tickIntervalInMilliSeconds;

  bool _finished = false;
  Timer? _timer;
  Timer? _ticker;
  int _ticks = 0;
  final Stopwatch _stopwatch = Stopwatch();

  DateTime? startTime;
  DateTime? endTime;

  final StreamController<int> _tickStreamController =
    StreamController<int>.broadcast();

  final StreamController<void> _finishedStreamController =
    StreamController<void>.broadcast();

  DefaultTimerService({
    required this.duration,
    this.tickIntervalInMilliSeconds = 500,
  });

  @override
  void start() {
    logger.v('Start - ${DateTime.now()}');

    // If already running nothing to do
    if (_stopwatch.isRunning) {
      return;
    }

    // Is this the first time start was called and timer not running?
    startTime ??= DateTime.now();

    _ticker = Timer.periodic(
      Duration(milliseconds: tickIntervalInMilliSeconds),
      (timer) {
        if (_stopwatch.isRunning) {
          _ticks++;
          _tickStreamController.add(_ticks);
        }
      }
    );

    _timer = Timer(_getRemainingTime(), _handleTimerCompleted);

    _stopwatch.start();
  }

  @override
  void stop() {
    logger.v('Stop');
    _stopwatch.stop();
    _timer?.cancel();
    _ticker?.cancel();
  }

  @override
  void reset() {
    logger.v('Reset');

    // stop the timer
    _timer?.cancel();
    _timer = null;

    // stop the ticker
    _ticker?.cancel();
    _ticker = null;

    // reset stopwatch
    _stopwatch.stop();
    _stopwatch.reset();

    // clear startTime
    startTime = null;

    // set ticks to 0 again
    _ticks = 0;
  }

  void _handleTimerCompleted() {
    logger.v('Complete - ${DateTime.now()}');

    _timer?.cancel();
    _timer = null;

    _ticker?.cancel();
    _ticker = null;

    _stopwatch.stop();

    endTime = DateTime.now();

    _finished = true;
    _finishedStreamController.add(null);
  }

  Duration _getRemainingTime() {
    int diff = duration.inMilliseconds - _stopwatch.elapsedMilliseconds;
    return Duration(milliseconds: diff);
  }

  @override
  bool get finished {
    return _finished;
  }

  @override
  int get ticks {
    return _ticks;
  }

  @override
  Duration get elapsedTime {
    return _stopwatch.elapsed;
  }

  @override
  bool get running {
    return _stopwatch.isRunning;
  }

  @override
  Stream<int> get tickStream {
    return _tickStreamController.stream;
  }

  @override
  Stream<void> get finishedStream {
    return _finishedStreamController.stream;
  }

  @override
  void close() {
    logger.v('Closing resources...');

    _stopwatch.stop();

    _timer?.cancel();
    _timer = null;

    _ticker?.cancel();
    _ticker = null;

    _tickStreamController.close();
    _finishedStreamController.close();

  }

}
