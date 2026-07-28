import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'session_query_options.freezed.dart';
part 'session_query_options.g.dart';

@freezed
sealed class SessionQueryOptions with _$SessionQueryOptions {

  const SessionQueryOptions._();

  const factory SessionQueryOptions({
    @Default(20) int limit,
  }) = _SessionQueryOptions;

  factory SessionQueryOptions.fromJson(Map<String, Object?> json) =>
      _$SessionQueryOptionsFromJson(json);

}
