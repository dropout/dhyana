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

  /// Returns the exact [LyricsLine] at the given [position], 
  /// or `null` if none.
  LyricsLine? getExactLine(Duration position) {
    final index = getExactLineIndex(position);
    return index == -1 ? null : lines[index];
  }

  /// Returns the index of the exact line in [lines].
  /// If the position falls between two lines returns -1 
  /// to indicate no exact line in the given position.
  int getExactLineIndex(Duration position) {
    for (var i = 0; i < lines.length; i++) {
      final line = lines[i];
      if (position >= line.start && position < line.end) {
        return i;
      }
    }
    return -1;
  }

  /// Returns the [LyricsLine] closest to [position].
  LyricsLine getClosestLine(Duration position) {
    final index = getClosestLineIndex(position);
    return lines[index];
  }

  /// Returns the index of the line closest to [position] in [lines].
  int getClosestLineIndex(Duration position) {
    int closestIndex = -1;
    Duration closestDistance = Duration.zero;

    for (var i = 0; i < lines.length; i++) {
      final line = lines[i];
      final distance = (line.start - position).abs();
      if (closestIndex == -1 || distance < closestDistance) {
        closestIndex = i;
        closestDistance = distance;
      }
    }
    return closestIndex;
  }

  factory LyricsDocument.fromJson(Map<String, dynamic> json) =>
    _$LyricsDocumentFromJson(json);
}
