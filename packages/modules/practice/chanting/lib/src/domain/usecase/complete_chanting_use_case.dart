import 'package:clock/clock.dart';
import 'package:chanting/src/domain/entity/chanting_state_entity.dart';

class CompleteChantingUseCase {

  Future<({ChantingStateEntity state})> execute(
    ChantingStateEntity state,
  ) async {
    final updatedState = state.copyWith(endTime: clock.now());
    return (state: updatedState);
  }

}
