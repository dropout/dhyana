import 'dart:async';

/// A StreamTransformer that throttles events using leading + trailing semantics.
///
/// The first event in an interval window is emitted immediately (leading edge).
/// Subsequent events received during the active interval are held as the latest
/// trailing event. When the interval timer fires:
/// - If a trailing event exists it is emitted and the timer restarts.
/// - If no trailing event exists the interval is marked inactive.
///
/// When the source stream closes, any pending trailing event is emitted before
/// the output stream is closed.
class ThrottleStreamTransformer<T> extends StreamTransformerBase<T, T> {
  final Duration interval;

  ThrottleStreamTransformer(this.interval);

  @override
  Stream<T> bind(Stream<T> stream) {
    StreamSubscription<T>? subscription;
    Timer? timer;
    T? trailingEvent;
    var hasTrailing = false;
    var intervalActive = false;

    late StreamController<T> controller;

    void startTimer() {
      timer = Timer(interval, () {
        if (hasTrailing) {
          controller.add(trailingEvent as T);
          hasTrailing = false;
          trailingEvent = null;
          startTimer(); // restart interval for the emitted trailing event
        } else {
          intervalActive = false;
          timer = null;
        }
      });
    }

    controller = StreamController<T>(
      onListen: () {
        subscription = stream.listen(
          (data) {
            if (!intervalActive) {
              // Leading edge: emit immediately and start the interval.
              controller.add(data);
              intervalActive = true;
              startTimer();
            } else {
              // Store as trailing event, replacing any previous pending one.
              trailingEvent = data;
              hasTrailing = true;
            }
          },
          onError: controller.addError,
          onDone: () {
            timer?.cancel();
            timer = null;
            if (hasTrailing) {
              controller.add(trailingEvent as T);
              hasTrailing = false;
              trailingEvent = null;
            }
            controller.close();
          },
        );
      },
      onPause: () {
        subscription?.pause();
        timer?.cancel();
        timer = null;
        intervalActive = false;
        hasTrailing = false;
        trailingEvent = null;
      },
      onResume: () {
        subscription?.resume();
      },
      onCancel: () {
        timer?.cancel();
        timer = null;
        intervalActive = false;
        hasTrailing = false;
        trailingEvent = null;
        return subscription?.cancel();
      },
    );

    return controller.stream;
  }
}
