import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'chant.dart';
import 'converter/date_time_or_null_converter.dart';
import 'model.dart';

part 'chanting_settings.freezed.dart';
part 'chanting_settings.g.dart';

@freezed
sealed class ChantingSettings with _$ChantingSettings implements Model {

  const ChantingSettings._();

  const factory ChantingSettings({
    required List<Chant> selectedChants,
    @DateTimeOrNullConverter() DateTime? lastUsed,
  }) = _ChantingSettings;

  factory ChantingSettings.fromJson(Map<String, Object?> json) =>
    _$ChantingSettingsFromJson(json);

  @override
  String get id {
    return selectedChants.map((chant) => chant.id).join('-');
  }

}

