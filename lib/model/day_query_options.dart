import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'day_query_options.freezed.dart';

@freezed
class DayQueryOptions with _$DayQueryOptions {

  const DayQueryOptions._();

  const factory DayQueryOptions({
    required DateTime from,
    required DateTime to,
    @Default(20) int limit,
  }) = _DayQueryOptions;

}
