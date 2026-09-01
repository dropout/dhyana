
/// Represents the processing state of an operation.
/// Useful for in-widget state management dealing async operations.
enum ProcessingState {
  idle,
  processing,
  completed,
  error,
}
