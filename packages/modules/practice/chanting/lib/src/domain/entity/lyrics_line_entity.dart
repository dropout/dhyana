import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'lyrics_word_entity.dart';

part 'lyrics_line_entity.freezed.dart';
part 'lyrics_line_entity.g.dart';

/// A single timed line in synchronized lyrics.
@freezed
sealed class LyricsLineEntity with _$LyricsLineEntity {
  const factory LyricsLineEntity({
    required String text,
    required Duration start,
    required Duration end,
    required List<LyricsWordEntity> words,
  }) = _LyricsLineEntity;

  factory LyricsLineEntity.fromJson(Map<String, dynamic> json) =>
      _$LyricsLineEntityFromJson(json);
}