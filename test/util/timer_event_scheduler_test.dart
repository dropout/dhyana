import 'dart:async';

import 'package:dhyana/util/timer_event_scheduler.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeElapsedTimeSource implements ElapsedTimeSource {
  final StreamController<Duration> _controller =
      StreamController<Duration>.broadcast();

  @override
  Stream<Duration> get elapsedTimeStream => _controller.stream;

  void emit(Duration elapsed) => _controller.add(elapsed);
  void close() => _controller.close();
}

void main() {
  late FakeElapsedTimeSource source;
  late TimerEventScheduler scheduler;

  setUp(() {
    source = FakeElapsedTimeSource();
    scheduler = TimerEventScheduler(source: source);
  });

  tearDown(() {
    scheduler.dispose();
    source.close();
  });

  test('listener fires when elapsed equals registered duration', () async {
    final fired = <Duration>[];
    scheduler.addListener(const Duration(seconds: 5), fired.add);
    scheduler.start();

    source.emit(const Duration(seconds: 5));
    await Future.delayed(Duration.zero);

    expect(fired, [const Duration(seconds: 5)]);
  });

  test('listener fires when elapsed jumps past registered duration', () async {
    final fired = <Duration>[];
    scheduler.addListener(const Duration(seconds: 5), fired.add);
    scheduler.start();

    source.emit(const Duration(seconds: 10));
    await Future.delayed(Duration.zero);

    expect(fired, [const Duration(seconds: 5)]);
  });

  test('listener fires only once after multiple ticks past it', () async {
    final fired = <Duration>[];
    scheduler.addListener(const Duration(seconds: 5), fired.add);
    scheduler.start();

    source.emit(const Duration(seconds: 5));
    source.emit(const Duration(seconds: 6));
    source.emit(const Duration(seconds: 7));
    await Future.delayed(Duration.zero);

    expect(fired, [const Duration(seconds: 5)]);
  });

  test('reset re-arms listener for the next cycle', () async {
    final fired = <Duration>[];
    scheduler.addListener(const Duration(seconds: 5), fired.add);
    scheduler.start();

    source.emit(const Duration(seconds: 5));
    await Future.delayed(Duration.zero);
    expect(fired.length, 1);

    scheduler.stop();
    scheduler.reset();
    scheduler.start();

    source.emit(const Duration(seconds: 5));
    await Future.delayed(Duration.zero);

    expect(fired.length, 2);
  });

  test('stop halts firing and preserves fired state', () async {
    final fired = <Duration>[];
    scheduler.addListener(const Duration(seconds: 5), fired.add);
    scheduler.start();

    source.emit(const Duration(seconds: 5));
    await Future.delayed(Duration.zero);
    expect(fired.length, 1);

    scheduler.stop();
    source.emit(const Duration(seconds: 5));
    await Future.delayed(Duration.zero);

    // Still only 1 — stop halted subscription; reset not called so still fired
    expect(fired.length, 1);
  });

  test('stop then start without reset does not re-fire', () async {
    final fired = <Duration>[];
    scheduler.addListener(const Duration(seconds: 5), fired.add);
    scheduler.start();

    source.emit(const Duration(seconds: 5));
    await Future.delayed(Duration.zero);
    expect(fired.length, 1);

    scheduler.stop();
    scheduler.start();
    source.emit(const Duration(seconds: 5));
    await Future.delayed(Duration.zero);

    expect(fired.length, 1);
  });

  test('removeListener prevents firing after removal', () async {
    final fired = <Duration>[];
    void listener(Duration d) => fired.add(d);

    scheduler.addListener(const Duration(seconds: 5), listener);
    scheduler.removeListener(const Duration(seconds: 5), listener);
    scheduler.start();

    source.emit(const Duration(seconds: 5));
    await Future.delayed(Duration.zero);

    expect(fired, isEmpty);
  });

  test('multiple listeners at same duration all fire', () async {
    final firedA = <Duration>[];
    final firedB = <Duration>[];

    scheduler.addListener(const Duration(seconds: 5), firedA.add);
    scheduler.addListener(const Duration(seconds: 5), firedB.add);
    scheduler.start();

    source.emit(const Duration(seconds: 5));
    await Future.delayed(Duration.zero);

    expect(firedA, [const Duration(seconds: 5)]);
    expect(firedB, [const Duration(seconds: 5)]);
  });

  test('independent durations dispatch independently', () async {
    final fired = <Duration>[];

    scheduler.addListener(const Duration(seconds: 3), fired.add);
    scheduler.addListener(const Duration(seconds: 7), fired.add);
    scheduler.addListener(const Duration(seconds: 10), fired.add);
    scheduler.start();

    source.emit(const Duration(seconds: 4));
    await Future.delayed(Duration.zero);
    expect(fired, [const Duration(seconds: 3)]);

    source.emit(const Duration(seconds: 8));
    await Future.delayed(Duration.zero);
    expect(fired, [const Duration(seconds: 3), const Duration(seconds: 7)]);

    source.emit(const Duration(seconds: 10));
    await Future.delayed(Duration.zero);
    expect(fired, [
      const Duration(seconds: 3),
      const Duration(seconds: 7),
      const Duration(seconds: 10),
    ]);
  });

  test('listener added before elapsed on tick boundary fires correctly', () async {
    final fired = <Duration>[];
    scheduler.addListener(const Duration(seconds: 5), fired.add);
    scheduler.addListener(const Duration(seconds: 5), fired.add);
    scheduler.start();

    source.emit(const Duration(seconds: 2));
    await Future.delayed(Duration.zero);
    expect(fired, isEmpty);

    source.emit(const Duration(seconds: 5));
    await Future.delayed(Duration.zero);
    expect(fired.length, 2);
  });
}
