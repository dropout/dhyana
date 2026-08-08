import 'package:dhyana/core/domain/entity/converter/date_time_or_null_converter.dart';
import 'package:dhyana/core/domain/entity/entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';


part 'chanting_settings_entity.freezed.dart';
part 'chanting_settings_entity.g.dart';

@freezed
sealed class ChantingSettingsEntity with _$ChantingSettingsEntity implements Dto {

  const ChantingSettingsEntity._();

  const factory ChantingSettingsEntity({
    required String id,
    @Default(<String>[]) List<String> selectedChants,
    @DateTimeOrNullConverter() DateTime? lastUsed,
  }) = _ChantingSettingsEntity;

  factory ChantingSettingsEntity.fromJson(Map<String, Object?> json) =>
    _$ChantingSettingsEntityFromJson(json);

}

