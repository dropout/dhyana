import 'dart:async';

import 'package:dhyana/util/debounce_stream_transformer.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  // Helper to collect events and errors from a transformed stream
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

    // Wait for the stream to close (or for the artificially provided wait)
    await Future.any([completer.future, Future.delayed(waitAfterClose)]);

    // ensure subscription cleaned up
    await sub.cancel();

    return {
      'events': events,
      'errors': errors,
    };
  }

  test('emits single event after duration', () async {
    final controller = StreamController<int>();
    final transformed = controller.stream.transform(DebounceStreamTransformer<int>(Duration(milliseconds: 20)));

    final future = collect<int>(transformed, waitAfterClose: Duration(milliseconds: 80));

    controller.add(1);
    controller.close();

    final result = await future;
    expect(result['events'], [1]);
    expect(result['errors'], isEmpty);
  });

  test('debounces multiple quick events and emits only the last', () async {
    final controller = StreamController<int>();
    final transformed = controller.stream.transform(DebounceStreamTransformer<int>(Duration(milliseconds: 20)));

    final future = collect<int>(transformed, waitAfterClose: Duration(milliseconds: 120));

    controller.add(1);
    await Future.delayed(Duration(milliseconds: 10));
    controller.add(2);
    await Future.delayed(Duration(milliseconds: 10));
    controller.add(3);
    controller.close();

    final result = await future;
    expect(result['events'], [3]);
    expect(result['errors'], isEmpty);
  });

  test('emits multiple spaced events when separated by > duration', () async {
    final controller = StreamController<int>();
    final transformed = controller.stream.transform(DebounceStreamTransformer<int>(Duration(milliseconds: 20)));

    final future = collect<int>(transformed, waitAfterClose: Duration(milliseconds: 120));

    controller.add(1);
    await Future.delayed(Duration(milliseconds: 30)); // > 20ms so first will emit
    controller.add(2);
    controller.close();

    final result = await future;
    expect(result['events'], [1, 2]);
    expect(result['errors'], isEmpty);
  });

  test('forwards errors from the source stream', () async {
    final controller = StreamController<int>();
    final transformed = controller.stream.transform(DebounceStreamTransformer<int>(Duration(milliseconds: 20)));

    final events = <int>[];
    final errors = <Object>[];
    final completer = Completer<void>();

    final sub = transformed.listen(
      events.add,
      onError: errors.add,
      onDone: () => completer.complete(),
    );

    // Emit an error and then close
    controller.addError(StateError('boom'));
    controller.close();

    // Wait a short moment to let the error propagate
    await Future.any([completer.future, Future.delayed(Duration(milliseconds: 80))]);
    await sub.cancel();

    expect(events, isEmpty);
    expect(errors, isNotEmpty);
    expect(errors.first, isA<StateError>());
  });

  test('on done emits last pending event immediately', () async {
    final controller = StreamController<int>();
    final transformed = controller.stream.transform(DebounceStreamTransformer<int>(Duration(milliseconds: 80)));

    final future = collect<int>(transformed, waitAfterClose: Duration(milliseconds: 200));

    // Add an event and close immediately. Implementation should emit the last event on done.
    controller.add(42);
    controller.close();

    final result = await future;
    expect(result['events'], [42]);
    expect(result['errors'], isEmpty);
  });

  test('supports nullable events (null is treated as a valid event)', () async {
    final controller = StreamController<int?>();
    final transformed = controller.stream.transform(DebounceStreamTransformer<int?>(Duration(milliseconds: 20)));

    final future = collect<int?>(transformed, waitAfterClose: Duration(milliseconds: 80));
    controller.add(null);
    controller.close();

    final captured = await future;

    expect(captured['events'], [null]);
    expect(captured['errors'], isEmpty);
  });

  test('cancelling subscription before timer fires prevents emission', () async {
    final controller = StreamController<int>();
    final transformed = controller.stream.transform(DebounceStreamTransformer<int>(Duration(milliseconds: 80)));

    final events = <int>[];
    final sub = transformed.listen(events.add);

    controller.add(99);
    // cancel before the debounce duration elapses
    await Future.delayed(Duration(milliseconds: 20));
    await sub.cancel();

    // give some time to see if any stray emissions happen
    await Future.delayed(Duration(milliseconds: 120));
    controller.close();

    expect(events, isEmpty);
  });
}
