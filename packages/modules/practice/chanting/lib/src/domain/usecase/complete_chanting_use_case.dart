import 'package:clock/clock.dart';
import 'package:core/core.dart';
import 'package:chanting/src/domain/entity/chanting_state_entity.dart';

class CompleteChantingUseCase {

  final IdGeneratorService idGeneratorService;

  CompleteChantingUseCase({
    required this.idGeneratorService,
  });

  Future<({ChantingStateEntity state})> execute(
    ChantingStateEntity state,
  ) async {
    final updatedState = state.copyWith(endTime: clock.now());
    return (state: updatedState);
  }
}
