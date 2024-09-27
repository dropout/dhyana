import 'package:dhyana/model/converter/date_time_converter.dart';
import 'package:dhyana/util/date_time_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'model.dart';

part 'year.freezed.dart';
part 'year.g.dart';

@freezed
class Year with _$Year implements Model {

  const Year._();

  const factory Year({
    required String id,
    @DateTimeConverter() required DateTime date,
    required int sessionCount,
    required int minutes,
  }) = _Year;

  factory Year.empty({
    required DateTime year,
  }) {
    return Year(
      id: year.toYearId(),
      date: year,
      sessionCount: 0,
      minutes: 0,
    );
  }

  factory Year.fromJson(Map<String, Object?> json) =>
      _$YearFromJson(json);

}
