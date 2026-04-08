import 'dart:async';

import 'package:dhyana/util/throttle_stream_transformer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Helper to collect events and errors from a transformed stream.
  Future<Map<String, List<dynamic>>> collect<T>(
    Stream<T> source, {
    required Duration waitAfterClose,
  }) async {
    final events = <T>[];
    final errors = <Object>[];
    final completer = Completer<void>();

    final sub = source.listen(
      events.add,
      onError: errors.add,
      onDone: () => completer.complete(),
    );

    await Future.any([completer.future, Future.delayed(waitAfterClose)]);
    await sub.cancel();

    return {
      'events': events,
      'errors': errors,
    };
  }

  test('single event is emitted immediately (leading edge)', () async {
    final controller = StreamController<int>();
    final transformed = controller.stream
        .transform(ThrottleStreamTransformer<int>(Duration(milliseconds: 50)));

    final future = collect<int>(transformed,
        waitAfterClose: Duration(milliseconds: 150));

    controller.add(1);
    controller.close();

    final result = await future;
    expect(result['events'], [1]);
    expect(result['errors'], isEmpty);
  });

  test('rapid events: emits first immediately, trailing once on timer', () async {
    final controller = StreamController<int>();
    final transformed = controller.stream
        .transform(ThrottleStreamTransformer<int>(Duration(milliseconds: 50)));

    final future = collect<int>(transformed,
        waitAfterClose: Duration(milliseconds: 200));

    // Fire several events within the interval window.
    controller.add(1); // leading → emitted immediately
    await Future.delayed(Duration(milliseconds: 10));
    controller.add(2); // trailing candidate
    await Future.delayed(Duration(milliseconds: 10));
    controller.add(3); // replaces previous trailing
    // Let the interval fire; 3 is the trailing and should be emitted.
    await Future.delayed(Duration(milliseconds: 60));
    controller.close();

    final result = await future;
    expect(result['events'], [1, 3]);
    expect(result['errors'], isEmpty);
  });

  test('spaced events separated by > interval each emit on leading edge',
      () async {
    final controller = StreamController<int>();
    final transformed = controller.stream
        .transform(ThrottleStreamTransformer<int>(Duration(milliseconds: 30)));

    final future = collect<int>(transformed,
        waitAfterClose: Duration(milliseconds: 200));

    controller.add(1);
    await Future.delayed(Duration(milliseconds: 50)); // > 30ms → interval expired
    controller.add(2);
    await Future.delayed(Duration(milliseconds: 50));
    controller.close();

    final result = await future;
    expect(result['events'], [1, 2]);
    expect(result['errors'], isEmpty);
  });

  test('trailing emission restarts timer (cascade trailing)', () async {
    final controller = StreamController<int>();
    final transformed = controller.stream
        .transform(ThrottleStreamTransformer<int>(Duration(milliseconds: 40)));

    final future = collect<int>(transformed,
        waitAfterClose: Duration(milliseconds: 300));

    controller.add(1); // leading → emitted at t=0
    await Future.delayed(Duration(milliseconds: 10));
    controller.add(2); // trailing
    await Future.delayed(Duration(milliseconds: 10));
    controller.add(3); // replaces trailing
    // At t≈40ms timer fires → emits 3 and restarts timer.
    // No more events arrive; second timer fires and clears interval.
    await Future.delayed(Duration(milliseconds: 120));
    controller.close();

    final result = await future;
    expect(result['events'], [1, 3]);
    expect(result['errors'], isEmpty);
  });

  test('source done flushes pending trailing event', () async {
    final controller = StreamController<int>();
    final transformed = controller.stream
        .transform(ThrottleStreamTransformer<int>(Duration(milliseconds: 50)));

    final future = collect<int>(transformed,
        waitAfterClose: Duration(milliseconds: 200));

    controller.add(1); // leading
    await Future.delayed(Duration(milliseconds: 10));
    controller.add(2); // trailing (timer hasn't fired)
    controller.close(); // done before timer fires → 2 must be flushed

    final result = await future;
    expect(result['events'], [1, 2]);
    expect(result['errors'], isEmpty);
  });

  test('forwards errors from the source stream', () async {
    final controller = StreamController<int>();
    final transformed = controller.stream
        .transform(ThrottleStreamTransformer<int>(Duration(milliseconds: 20)));

    final events = <int>[];
    final errors = <Object>[];
    final completer = Completer<void>();

    final sub = transformed.listen(
      events.add,
      onError: errors.add,
      onDone: () => completer.complete(),
    );

    controller.addError(StateError('boom'));
    controller.close();

    await Future.any(
        [completer.future, Future.delayed(Duration(milliseconds: 80))]);
    await sub.cancel();

    expect(events, isEmpty);
    expect(errors, isNotEmpty);
    expect(errors.first, isA<StateError>());
  });

  test('supports nullable events (null is a valid leading event)', () async {
    final controller = StreamController<int?>();
    final transformed = controller.stream
        .transform(ThrottleStreamTransformer<int?>(Duration(milliseconds: 20)));

    final future = collect<int?>(transformed,
        waitAfterClose: Duration(milliseconds: 80));

    controller.add(null);
    controller.close();

    final result = await future;
    expect(result['events'], [null]);
    expect(result['errors'], isEmpty);
  });

  test('cancelling before timer fires prevents trailing emission', () async {
    final controller = StreamController<int>();
    final transformed = controller.stream
        .transform(ThrottleStreamTransformer<int>(Duration(milliseconds: 80)));

    final events = <int>[];
    final sub = transformed.listen(events.add);

    controller.add(1); // leading → emitted immediately
    await Future.delayed(Duration(milliseconds: 10));
    controller.add(2); // trailing pending
    await Future.delayed(Duration(milliseconds: 10));
    await sub.cancel(); // cancel before interval fires

    // Wait beyond the interval to confirm nothing extra is emitted.
    await Future.delayed(Duration(milliseconds: 100));

    expect(events, [1]);
  });
}
