// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lyrics_word_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LyricsWordEntity _$LyricsWordEntityFromJson(Map<String, dynamic> json) =>
    _LyricsWordEntity(
      text: json['text'] as String,
      start: Duration(microseconds: (json['start'] as num).toInt()),
      end: Duration(microseconds: (json['end'] as num).toInt()),
    );

Map<String, dynamic> _$LyricsWordEntityToJson(_LyricsWordEntity instance) =>
    <String, dynamic>{
      'text': instance.text,
      'start': instance.start.inMicroseconds,
      'end': instance.end.inMicroseconds,
    };
