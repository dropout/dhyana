import 'package:dhyana/core/domain/entity/converter/date_time_converter.dart';
import 'package:dhyana/core/domain/entity/converter/duration_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_session.freezed.dart';

enum ProfileSessionType {
  sitting,
  chanting,
}

@freezed
sealed class ProfileSession with _$ProfileSession {
  const factory ProfileSession({
    required String id,
    required ProfileSessionType type,
    @DateTimeConverter() required DateTime startTime,
    @DateTimeConverter() required DateTime endTime,
    @DurationConverter() required Duration duration,
  }) = _ProfileSession;
}