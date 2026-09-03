import 'package:chanting/src/public/model/chant_meta_data.dart';
import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';


part 'chant.freezed.dart';
part 'chant.g.dart';

@freezed
sealed class Chant with _$Chant implements SerializableEntity {

  const Chant._();

  const factory Chant({
    required String id,
    required String name,
    required ChantMetaData metaData,
    required String blurHash,
    @Default(0) int order,
    @DurationConverter() required Duration length,    
  }) = _Chant;

  factory Chant.fromJson(Map<String, Object?> json) =>
    _$ChantFromJson(json);

}
