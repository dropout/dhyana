import 'package:dhyana/model/converter/date_time_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'model.dart';

part 'month.freezed.dart';
part 'month.g.dart';

@freezed
sealed class Month with _$Month implements Model {

  const Month._();

  const factory Month({
    required String id,
    @DateTimeConverter() required DateTime startDate,
    @Default(0) int minutesCount,
    @Default(0) int sessionCount,
  }) = _Month;

  factory Month.fromJson(Map<String, Object?> json) =>
      _$MonthFromJson(json);

}
