import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_query_options.freezed.dart';
part 'profile_query_options.g.dart';

@freezed
class ProfileQueryOptions with _$ProfileQueryOptions {

  const ProfileQueryOptions._();

  const factory ProfileQueryOptions({
    @Default(20) int limit,
  }) = _ProfileQueryOptions;

  factory ProfileQueryOptions.fromJson(Map<String, Object?> json) =>
      _$ProfileQueryOptionsFromJson(json);

}
