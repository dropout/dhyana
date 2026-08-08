import 'package:dhyana/modules/practice/timer/timer_module.dart';
import 'package:dhyana/modules/practice/timer/domain/enum/timer_stage.dart';
import 'package:dhyana/modules/practice/timer/domain/enum/timer_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'timer_state_entity.freezed.dart';

@freezed
sealed class TimerStateEntity with _$TimerStateEntity {

  const TimerStateEntity._();

  const factory TimerStateEntity({
    required TimerSettings timerSettings,
    required TimerStatus timerStatus,
    required TimerStage timerStage,
    required Duration elapsedWarmupTime,
    required Duration elapsedTime,
    DateTime? startTime,
    DateTime? endTime,
  }) = _TimerStateEntity;

  factory TimerStateEntity.initial({required TimerSettings timerSettings}) {
    return TimerStateEntity(
      timerSettings: timerSettings,
      timerStatus: TimerStatus.idle,
      timerStage: (timerSettings.warmup != Duration.zero) 
        ? TimerStage.warmup 
        : TimerStage.timer,
      elapsedWarmupTime: Duration.zero,
      elapsedTime: Duration.zero,
    );
  }

  factory TimerStateEntity.completed({
    required TimerSettings timerSettings,
    required DateTime startTime,
    required DateTime endTime,
    required Duration elapsedTime,
    required Duration elapsedWarmupTime,
  }) {
    return TimerStateEntity(
      timerSettings: timerSettings,
      timerStatus: TimerStatus.completed,
      timerStage: TimerStage.timer,
      elapsedWarmupTime: elapsedWarmupTime,
      elapsedTime: elapsedTime,
      startTime: startTime,
      endTime: endTime,
    );
  }
  
}
