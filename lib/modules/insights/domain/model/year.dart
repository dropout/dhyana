import 'package:dhyana/core/domain/model/converter/date_time_converter.dart';
import 'package:dhyana/core/domain/model/model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'year.freezed.dart';
part 'year.g.dart';

@freezed
sealed class Year with _$Year implements Model {

  const Year._();

  const factory Year({
    required String id,
    @DateTimeConverter() required DateTime startDate,
    @Default(0) int minutesCount,
    @Default(0) int sessionCount,
  }) = _Year;

  factory Year.fromJson(Map<String, Object?> json) =>
      _$YearFromJson(json);

}
