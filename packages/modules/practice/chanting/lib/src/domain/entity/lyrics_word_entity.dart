import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'lyrics_word_entity.freezed.dart';
part 'lyrics_word_entity.g.dart';

@freezed
sealed class LyricsWordEntity with _$LyricsWordEntity {
  
  const LyricsWordEntity._();

  const factory LyricsWordEntity({
    required String text,
    required Duration start,
    required Duration end,
  }) = _LyricsWordEntity;

  @JsonKey(includeToJson: false, includeFromJson: false)
  Duration get duration => end - start;

  factory LyricsWordEntity.fromJson(Map<String, dynamic> json) =>
    _$LyricsWordEntityFromJson(json);
}
