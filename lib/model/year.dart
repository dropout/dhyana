import 'package:dhyana/model/converter/date_time_converter.dart';
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
    @DateTimeConverter() required DateTime startDate,
    @Default(0) int sessionCount,
    @Default(0) int minutes,
  }) = _Year;

  factory Year.fromJson(Map<String, Object?> json) =>
      _$YearFromJson(json);

}
