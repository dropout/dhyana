import 'package:core/core.dart';
import 'package:chanting/src/public/model/chant_playlist_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';


part 'chanting_settings.freezed.dart';
part 'chanting_settings.g.dart';

@freezed
sealed class ChantingSettings with _$ChantingSettings implements Dto {

  const ChantingSettings._();

  const factory ChantingSettings({
    @Default(<ChantPlaylistItem>[]) List<ChantPlaylistItem> selectedChants,
    @DateTimeOrNullConverter() DateTime? lastUsed,
  }) = _ChantingSettings;

  @override
  String get id {
    return selectedChants.map((viewModel) => viewModel.chantId).join('-');
  }

  factory ChantingSettings.fromJson(Map<String, dynamic> json) =>
      _$ChantingSettingsFromJson(json);

}

