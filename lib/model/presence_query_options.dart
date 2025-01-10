import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';


part 'presence_query_options.freezed.dart';
part 'presence_query_options.g.dart';

@freezed
class PresenceQueryOptions with _$PresenceQueryOptions {

  const PresenceQueryOptions._();

  const factory PresenceQueryOptions({
    @Default(Duration(hours: 3)) Duration windowSize,
    @Default(20) int limit,
    String ? ownProfileId,
    String? lastDocumentId,
  }) = _PresenceQueryOptions;

  factory PresenceQueryOptions.fromJson(Map<String, Object?> json) =>
      _$PresenceQueryOptionsFromJson(json);

}
