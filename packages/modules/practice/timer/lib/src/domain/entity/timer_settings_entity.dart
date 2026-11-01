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
    // Unknown sounds (e.g. removed ones) fall back to the default instead of throwing.
    @JsonKey(unknownEnumValue: Sound.triangle) @Default(Sound.triangle) Sound intervalSound,
    @JsonKey(unknownEnumValue: Sound.smallBell) @Default(Sound.smallBell) Sound startingSound,
    @JsonKey(unknownEnumValue: Sound.smallBell) @Default(Sound.smallBell) Sound endingSound,
    @DateTimeOrNullConverter() DateTime? lastUsed,
  }) = _TimerSettingsEntity;

  factory TimerSettingsEntity.fromJson(Map<String, Object?> json) =>
    _$TimerSettingsEntityFromJson(json);

  // Bump the version whenever an identity field is added or changed.
  static const _idVersion = 1;

  /// Deterministic Firestore document id; excludes [lastUsed] as it is usage metadata.
  @override
  String get id {
    return [
      'v$_idVersion',
      warmup.inSeconds,
      duration.inSeconds,
      intervalCount,
      intervalSound.id,
      startingSound.id,
      endingSound.id,
    ].join('_');
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
