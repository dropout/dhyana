
/// Defines the possible states of audio playback in the application.
/// Used by the [AudioService] to represent the current state of audio playback.
/// Library implementations should map their states to these internal states.
enum PlaybackState {
  idle,
  loading,
  playing,
  paused,
  stopped,
  completed,
  error,
  disposed,
}