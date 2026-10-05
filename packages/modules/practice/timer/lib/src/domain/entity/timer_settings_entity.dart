import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'timer_settings_entity.freezed.dart';
part 'timer_settings_entity.g.dart';

/// Domain-owned timer configuration, independent of the module's public DTO.
@freezed
sealed class TimerSettingsEntity with _$TimerSettingsEntity implements SerializableEntity {

  const TimerSettingsEntity._();

  const factory TimerSettingsEntity({
    @DurationConverter() @Default(Duration(minutes: 1)) Duration warmup,
    @DurationConverter() @Default(Duration(minutes: 10)) Duration duration,
    @Default(0) int intervalCount,
    @Default(Sound.triangle) Sound intervalSound,
    @Default(Sound.smallBell) Sound startingSound,
    @Default(Sound.smallBell) Sound endingSound,
    @DateTimeOrNullConverter() DateTime? lastUsed,
  }) = _TimerSettingsEntity;

  factory TimerSettingsEntity.fromJson(Map<String, Object?> json) =>
    _$TimerSettingsEntityFromJson(json);

  factory TimerSettingsEntity.fromIdString(String idString) {
    try {
      List<String> parts = idString.split('-');
      Duration warmup = Duration(seconds: int.parse(parts[0], radix: 10));
      Sound startingSound = getSoundById(int.parse(parts[2], radix: 10));
      Duration duration = Duration(seconds: int.parse(parts[1], radix: 10));
      Sound endingSound = getSoundById(int.parse(parts[2], radix: 10));
      return TimerSettingsEntity(
        warmup: warmup,
        duration: duration,
        startingSound: startingSound,
        endingSound: endingSound,
      );
    } catch(e) {
      throw Exception('Unable to convert idString: $idString to TimerSettings');
    }
  }

  @override
  String get id {
    return '${warmup.inSeconds}-${startingSound.id}-${duration.inSeconds}-${endingSound.id}';
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  bool get hasWarmupTime {
    return warmup != Duration.zero;
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  Duration get totalTime {
    return warmup + duration;
  }

}
