import 'package:dhyana/core/domain/entity/session.dart';
import 'package:dhyana/core/service/id_generator_service.dart';
import 'package:dhyana/modules/practice/chanting/domain/entity/chanting_state_entity.dart';

class CompleteChantingUseCase {

  final IdGeneratorService idGeneratorService;

  CompleteChantingUseCase({
    required this.idGeneratorService,
  });

  Future<({ChantingStateEntity state, Session session})> execute(
    ChantingStateEntity state,
  ) async {
    final updatedState = state.copyWith(endTime: DateTime.now());

    final session = Session(
      id: idGeneratorService.sessionId(),
      type: .chanting,
      startTime: updatedState.startTime ?? DateTime.now().subtract(updatedState.elapsedSessionTime),
      endTime: updatedState.endTime ?? DateTime.now(),
      duration: updatedState.elapsedSessionTime,
    );

    return (state: updatedState, session: session);
  }
}
