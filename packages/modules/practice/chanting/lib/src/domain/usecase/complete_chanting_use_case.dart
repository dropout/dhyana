import 'package:core/core.dart';
import 'package:chanting/src/domain/entity/chanting_state_entity.dart';

class CompleteChantingUseCase {

  final IdGeneratorService idGeneratorService;

  CompleteChantingUseCase({
    required this.idGeneratorService,
  });

  Future<({ChantingStateEntity state, SessionEntity session})> execute(
    ChantingStateEntity state,
  ) async {
    final updatedState = state.copyWith(endTime: DateTime.now());

    final session = SessionEntity(
      id: idGeneratorService.sessionId(),
      type: .chanting,
      startTime: updatedState.startTime ?? DateTime.now().subtract(updatedState.elapsedSessionTime),
      endTime: updatedState.endTime ?? DateTime.now(),
      duration: updatedState.elapsedSessionTime,
    );

    return (state: updatedState, session: session);
  }
}
