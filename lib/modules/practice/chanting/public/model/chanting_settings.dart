import 'package:dhyana/core/domain/entity/converter/date_time_or_null_converter.dart';
import 'package:dhyana/core/domain/entity/entity.dart';
import 'package:dhyana/modules/practice/chanting/public/model/chant_playlist_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';


part 'chanting_settings.freezed.dart';

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

}

