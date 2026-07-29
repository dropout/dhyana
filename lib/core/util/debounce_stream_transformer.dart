import 'dart:async';

/// A StreamTransformer that debounces events.
///
/// This transformer will only emit the latest event from the source stream
/// after a specified [duration] has passed without any new events.
class DebounceStreamTransformer<T> extends StreamTransformerBase<T, T> {

  final Duration duration;

  DebounceStreamTransformer(this.duration);

  @override
  Stream<T> bind(Stream<T> stream) {
    // These variables are shared across the controller's callbacks.
    StreamSubscription<T>? subscription; // The subscription to the *source* stream
    Timer? timer;
    T? latestEvent;
    var hasLatest = false; // tracks whether latestEvent is valid (supports nullable T)

    // The controller for the *output* stream. This is created immediately.
    late StreamController<T> controller;

    controller = StreamController<T>(
      onListen: () {
        // This is called when the *output* stream gets a listener.
        // Now, we subscribe to the *source* stream.
        subscription = stream.listen(
          (data) {
            // An event arrived from the source.
            latestEvent = data;
            hasLatest = true;
            timer?.cancel(); // Cancel any existing timer
            timer = Timer(duration, () {
              // Timer fired! Emit the latest event (if one exists).
              if (hasLatest) {
                controller.add(latestEvent as T);
                hasLatest = false;
                latestEvent = null;
              }
              timer = null; // Clear the timer
            });
          },
          onError: controller.addError, // Pass errors through
          onDone: () {
            // The source stream is done.
            // If there's a pending timer, cancel it and emit the last event.
            if (timer != null && timer!.isActive) {
              timer!.cancel();
              if (hasLatest) {
                controller.add(latestEvent as T);
                hasLatest = false;
                latestEvent = null;
              }
            }
            controller.close(); // Close the output stream
          },
        );
      },
      onPause: () {
        // When the output stream is paused, pause the source and cancel/clear any pending timer/event.
        subscription?.pause();
        timer?.cancel();
        timer = null;
        hasLatest = false;
        latestEvent = null;
      },
      onResume: () {
        // When the output stream is resumed, resume the source.
        subscription?.resume();
      },
      onCancel: () {
        // The listener on the *output* stream has been cancelled.
        // We must clean up our subscription to the *source* stream and clear any pending data.
        timer?.cancel();
        timer = null;
        hasLatest = false;
        latestEvent = null;
        return subscription?.cancel();
      },
    );

    // This is now valid, as 'controller' is guaranteed to be non-null.
    return controller.stream;
  }
}
