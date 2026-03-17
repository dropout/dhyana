import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'lyrics_word.freezed.dart';
part 'lyrics_word.g.dart';

@freezed
sealed class LyricsWord with _$LyricsWord {
  
  const LyricsWord._();

  const factory LyricsWord({
    required String text,
    required Duration start,
    required Duration end,
  }) = _LyricsWord;

  @JsonKey(includeToJson: false, includeFromJson: false)
  Duration get duration => end - start;

  factory LyricsWord.fromJson(Map<String, dynamic> json) =>
    _$LyricsWordFromJson(json);
}
