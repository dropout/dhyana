import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'lyrics_line.dart';

part 'lyrics_document.freezed.dart';
part 'lyrics_document.g.dart';

/// Immutable lyrics document containing ordered lyric lines.
@freezed
sealed class LyricsDocument with _$LyricsDocument {

  const LyricsDocument._();
  
  const factory LyricsDocument({
    required List<LyricsLine> lines,
  }) = _LyricsDocument;

  /// Returns the [LyricsLine] active at [position], or `null` if none.
  ///
  /// A line is considered active when `line.start <= position < line.end`.
  LyricsLine? activeLine(Duration position) {
    final index = activeLineIndex(position);
    return index == -1 ? null : lines[index];
  }

  /// Returns the index of the active line in [lines], or `-1` if none.
  int activeLineIndex(Duration position) {
    for (var i = 0; i < lines.length; i++) {
      final line = lines[i];
      if (position >= line.start && position < line.end) {
        return i;
      }
    }
    return -1;
  }

  factory LyricsDocument.fromJson(Map<String, dynamic> json) =>
    _$LyricsDocumentFromJson(json);
}
