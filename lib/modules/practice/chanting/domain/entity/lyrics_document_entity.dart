import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'lyrics_line_entity.dart';

part 'lyrics_document_entity.freezed.dart';
part 'lyrics_document_entity.g.dart';

/// Immutable lyrics document containing ordered lyric lines.
@freezed
sealed class LyricsDocumentEntity with _$LyricsDocumentEntity {

  const LyricsDocumentEntity._();
  
  const factory LyricsDocumentEntity({
    required List<LyricsLineEntity> lines,
  }) = _LyricsDocumentEntity;

  /// Returns the exact [LyricsLineEntity] at the given [position], 
  /// or `null` if none.
  LyricsLineEntity? getExactLine(Duration position) {
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

  /// Returns the [LyricsLineEntity] closest to [position].
  LyricsLineEntity getClosestLine(Duration position) {
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

  factory LyricsDocumentEntity.fromJson(Map<String, dynamic> json) =>
    _$LyricsDocumentEntityFromJson(json);
}
