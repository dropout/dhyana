import 'package:dhyana/core/domain/enum/sound.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';

@freezed
sealed class UiTimerSettings with _$UiTimerSettings {
  const UiTimerSettings._();

  const factory UiTimerSettings({
    required Duration warmupDuration,
    required Duration sessionDuration,
    required int intervalCount,
    required Sound startingSound,
    required Sound endingSound,    
    required Sound intervalSound,
  }) = _UiTimerSettings;
}
