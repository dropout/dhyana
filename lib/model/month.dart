import 'package:dhyana/model/converter/date_time_converter.dart';
import 'package:dhyana/util/date_time_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'model.dart';

part 'month.freezed.dart';
part 'month.g.dart';

@freezed
class Month with _$Month implements Model {

  const Month._();

  const factory Month({
    required String id,
    @DateTimeConverter() required DateTime date,
    required int sessionCount,
    required int minutes,
  }) = _Month;

  factory Month.empty({
    required DateTime month,
  }) {
    return Month(
      id: month.toMonthId(),
      date: month,
      sessionCount: 0,
      minutes: 0,
    );
  }

  factory Month.fromJson(Map<String, Object?> json) =>
      _$MonthFromJson(json);

}
