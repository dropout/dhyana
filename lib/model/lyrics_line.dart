import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'lyrics_word.dart';

part 'lyrics_line.freezed.dart';
part 'lyrics_line.g.dart';

/// A single timed line in synchronized lyrics.
@freezed
sealed class LyricsLine with _$LyricsLine {
  const factory LyricsLine({
    required String text,
    required Duration start,
    required Duration end,
    required List<LyricsWord> words,
  }) = _LyricsLine;

  factory LyricsLine.fromJson(Map<String, dynamic> json) =>
      _$LyricsLineFromJson(json);
}