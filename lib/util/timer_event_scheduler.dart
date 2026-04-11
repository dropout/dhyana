import 'dart:async';

/// Callback signature for a scheduled timer event.
///
/// [value] is the [Duration] the listener was registered at.
typedef TimerEventListener = void Function(Duration value);

/// Minimal interface for a source of elapsed time.
///
/// Implement this to adapt any timer to [TimerEventScheduler].
abstract interface class ElapsedTimeSource {
  /// Emits the current elapsed [Duration] on every tick.
  Stream<Duration> get elapsedTimeStream;
}

/// Fires registered [TimerEventListener]s once when elapsed time reaches their
/// registered [Duration].
///
/// The scheduler does not own its timer — it operates on an injected
/// [ElapsedTimeSource], keeping timer lifecycle management separate.
///
/// Typical usage:
/// ```dart
/// final scheduler = TimerEventScheduler(source: myElapsedTimeSource);
/// scheduler.addListener(Duration(minutes: 5), (d) => print('5 min reached'));
/// scheduler.start();
/// // later...
/// scheduler.stop();
/// scheduler.reset(); // re-arms all listeners
/// scheduler.dispose(); // clean up
/// ```
class TimerEventScheduler {
  final ElapsedTimeSource _source;

  final Map<Duration, List<TimerEventListener>> _listeners = {};
  final Set<Duration> _fired = {};

  StreamSubscription<Duration>? _subscription;

  TimerEventScheduler({required ElapsedTimeSource source}) : _source = source;

  /// Registers [listener] to fire once when elapsed time reaches [at].
  ///
  /// Multiple listeners may be registered at the same [at] value.
  void addListener(Duration at, TimerEventListener listener) {
    _listeners.putIfAbsent(at, () => []).add(listener);
  }

  /// Removes a previously registered [listener] at [at].
  ///
  /// Does nothing if the listener is not found.
  void removeListener(Duration at, TimerEventListener listener) {
    final list = _listeners[at];
    if (list == null) return;
    list.remove(listener);
    if (list.isEmpty) _listeners.remove(at);
  }

  /// Starts listening to the [ElapsedTimeSource] and dispatching listeners.
  ///
  /// Calling [start] while already running is a no-op.
  void start() {
    if (_subscription != null) return;
    _subscription = _source.elapsedTimeStream.listen(_onElapsed);
  }

  /// Stops listening without clearing fired state.
  ///
  /// Call [start] again to resume. Previously fired listeners remain fired
  /// until [reset] is called.
  void stop() {
    _subscription?.cancel();
    _subscription = null;
  }

  /// Clears the fired state so all listeners will fire again on the next cycle.
  ///
  /// Does not affect the running state — call [start] separately if needed.
  void reset() {
    _fired.clear();
  }

  /// Cancels the subscription and clears all registered listeners and state.
  ///
  /// The scheduler cannot be used after [dispose] is called.
  void dispose() {
    _subscription?.cancel();
    _subscription = null;
    _listeners.clear();
    _fired.clear();
  }

  void _onElapsed(Duration elapsed) {
    for (final entry in _listeners.entries) {
      final at = entry.key;
      if (_fired.contains(at)) continue;
      if (elapsed >= at) {
        _fired.add(at);
        for (final listener in List.of(entry.value)) {
          listener(at);
        }
      }
    }
  }

  bool get isRunning => _subscription != null;
  bool get hasListeners => _listeners.isNotEmpty;
  int get listenerCount =>
    _listeners.values.fold(0, (sum, list) => sum + list.length);

  @override
  String toString() {
    return 'TimerEventScheduler(isRunning: $isRunning, listeners: $listenerCount, at: ${_listeners.keys.toList()} )';
  }

}
