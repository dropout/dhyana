// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lyrics_document_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LyricsDocumentEntity _$LyricsDocumentEntityFromJson(
  Map<String, dynamic> json,
) => _LyricsDocumentEntity(
  lines: (json['lines'] as List<dynamic>)
      .map((e) => LyricsLineEntity.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$LyricsDocumentEntityToJson(
  _LyricsDocumentEntity instance,
) => <String, dynamic>{'lines': instance.lines};
