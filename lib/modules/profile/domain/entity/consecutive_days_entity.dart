import 'package:dhyana/core/data/converter/date_time_or_null_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'consecutive_days_entity.freezed.dart';
part 'consecutive_days_entity.g.dart';

// When editing profile make sure to check the profile model
// in firebase functions, because thats where the
// initial profile db record is created.

@freezed
sealed class ConsecutiveDaysEntity with _$ConsecutiveDaysEntity {

  const ConsecutiveDaysEntity._();

  const factory ConsecutiveDaysEntity({
    @Default(0) int current,
    @Default(0) int longest,
    @DateTimeOrNullConverter() DateTime? startedAt,
    @DateTimeOrNullConverter() DateTime? lastChecked,
  }) = _ConsecutiveDaysEntity;

  factory ConsecutiveDaysEntity.fromJson(Map<String, Object?> json) =>
    _$ConsecutiveDaysEntityFromJson(json);

}
