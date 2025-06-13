import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'week_query_options.freezed.dart';

@freezed
sealed class WeekQueryOptions with _$WeekQueryOptions {

  const WeekQueryOptions._();

  const factory WeekQueryOptions({
    required DateTime from,
    required DateTime to,
    @Default(20) int limit,
  }) = _WeekQueryOptions;

}
