// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lyrics_line_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LyricsLineEntity _$LyricsLineEntityFromJson(Map<String, dynamic> json) =>
    _LyricsLineEntity(
      text: json['text'] as String,
      start: Duration(microseconds: (json['start'] as num).toInt()),
      end: Duration(microseconds: (json['end'] as num).toInt()),
      words: (json['words'] as List<dynamic>)
          .map((e) => LyricsWordEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LyricsLineEntityToJson(_LyricsLineEntity instance) =>
    <String, dynamic>{
      'text': instance.text,
      'start': instance.start.inMicroseconds,
      'end': instance.end.inMicroseconds,
      'words': instance.words,
    };
