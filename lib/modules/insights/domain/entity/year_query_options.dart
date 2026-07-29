import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'year_query_options.freezed.dart';

@freezed
sealed class YearQueryOptions with _$YearQueryOptions {

  const YearQueryOptions._();

  const factory YearQueryOptions({
    required DateTime from,
    required DateTime to,
    @Default(20) int limit,
  }) = _YearQueryOptions;

}
