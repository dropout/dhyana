import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:dhyana/model/converter/date_time_converter.dart';

import 'model.dart';

part 'week.freezed.dart';
part 'week.g.dart';

@freezed
sealed class Week with _$Week implements Model {

  const Week._();

  const factory Week({
    required String id,
    @DateTimeConverter() required DateTime startDate,
    @Default(0) int minutesCount,
    @Default(0) int sessionCount,
  }) = _Week;

  factory Week.fromJson(Map<String, Object?> json) =>
    _$WeekFromJson(json);

}
