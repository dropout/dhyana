import 'package:dhyana/core/domain/enum/session_type.dart';
import 'package:dhyana/core/data/converter/duration_converter.dart';
import 'package:dhyana/core/domain/entity/entity.dart';
import 'package:dhyana/core/data/converter/date_time_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'insights_session.freezed.dart';

@freezed
sealed class InsightsSession with _$InsightsSession implements Dto {

  const InsightsSession._();

  const factory InsightsSession({
    required String id,
    required SessionType type,
    @DateTimeConverter() required DateTime startTime,
    @DateTimeConverter() required DateTime endTime,
    @DurationConverter() required Duration duration,
  }) = _InsightsSession;

}
