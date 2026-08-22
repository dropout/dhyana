import 'package:dhyana/core/domain/entity/entity.dart';
import 'package:dhyana/core/data/converter/duration_converter.dart';
import 'package:dhyana/modules/practice/chanting/domain/entity/chant_metadata_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';


part 'chant_entity.freezed.dart';
part 'chant_entity.g.dart';

@freezed
sealed class ChantEntity with _$ChantEntity implements Dto {

  const ChantEntity._();

  const factory ChantEntity({
    required String id,
    required String name,
    required ChantMetaDataEntity metaData,
    required String blurHash,
    @Default(0) int order,
    @DurationConverter() required Duration length,    
  }) = _ChantEntity;

  factory ChantEntity.fromJson(Map<String, Object?> json) =>
    _$ChantEntityFromJson(json);

}
