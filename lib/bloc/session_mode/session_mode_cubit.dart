import 'package:dhyana/enum/session_type.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Cubit responsible for toggling between available session modes on the home
/// screen (e.g. timer vs. chanting settings).
final class SessionModeCubit extends Cubit<SessionType> {
  SessionModeCubit({
    SessionType initialMode = SessionType.sitting,
  }) : super(initialMode);

  /// Explicitly sets the current session mode. Emits only when the requested
  /// mode differs from the active mode.
  void setMode(SessionType mode) {
    if (mode == state) {
      return;
    }

    emit(mode);
  }

  /// Convenience helper that flips between `SessionType.sitting` (timer) and
  /// `SessionType.chanting`.
  void toggleMode() {
    emit(
      state == SessionType.sitting
          ? SessionType.chanting
          : SessionType.sitting,
    );
  }
}