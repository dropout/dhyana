import 'package:dhyana/core/domain/entity/entity.dart';
import 'package:dhyana/core/data/converter/duration_converter.dart';
import 'package:dhyana/modules/practice/chanting/domain/entity/chant_metadata_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';


part 'chant.freezed.dart';
part 'chant.g.dart';

@freezed
sealed class Chant with _$Chant implements Dto {

  const Chant._();

  const factory Chant({
    required String id,
    required String name,
    required ChantMetaDataEntity metaData,
    required String blurHash,
    @Default(0) int order,
    @DurationConverter() required Duration length,    
  }) = _Chant;

  factory Chant.fromJson(Map<String, Object?> json) =>
    _$ChantFromJson(json);

}
