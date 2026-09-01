import 'dart:async';

/// An Application-wide event bus interface: useful for example decoupling timer, 
/// and social features when starting a timer, when auth state changes, etc.
abstract interface class AppEventBus {
  
  /// Publishes an application-wide event of type [T].
  void publish<T extends AppEvent>(T event);
  
  /// Listens to application-wide events of type [T].
  Stream<T> on<T extends AppEvent>();
}

/// An interface for an application event.
abstract interface class AppEvent {
  DateTime get timestamp;
}

/// The default implementation of the application-wide event bus.
class DefaultAppEventBus implements AppEventBus {

  /// A broadcast stream to address multiple listeneres.
  final _controller = StreamController.broadcast();

  @override
  void publish<T extends AppEvent>(T event) {
    _controller.add(event);
  }

  @override
  Stream<T> on<T extends AppEvent>() {
    return _controller.stream.where((event) => event is T).cast<T>();
  }
}
