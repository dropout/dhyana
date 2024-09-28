import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'month_query_options.freezed.dart';

@freezed
class MonthQueryOptions with _$MonthQueryOptions {

  const MonthQueryOptions._();

  const factory MonthQueryOptions({
    required DateTime from,
    required DateTime to,
    @Default(20) int limit,
  }) = _MonthQueryOptions;

}
