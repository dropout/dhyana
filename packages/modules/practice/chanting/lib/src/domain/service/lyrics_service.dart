import 'package:assa_parser/assa_parser.dart';
import 'package:chanting/src/domain/entity/lyrics_document_entity.dart';
import 'dart:io';
import 'dart:convert';

import 'package:chanting/src/domain/entity/lyrics_line_entity.dart';
import 'package:chanting/src/domain/entity/lyrics_word_entity.dart';

class LyricsService {
  final AssaParser _assaParser = AssaParser();
  
  Future<LyricsDocumentEntity> loadLyrics(String lyricsResourceUrl) async {
    if (_isRemoteUrl(lyricsResourceUrl)) {
      return _loadLyricsFromRemote(lyricsResourceUrl);
    }

    return _loadLyricsFromLocalFile(lyricsResourceUrl);
  }

  Future<LyricsDocumentEntity> _loadLyricsFromRemote(String lyricsResourceUrl) async {
    final HttpClient httpClient = HttpClient();
    final HttpClientRequest request = await httpClient.getUrl(
      Uri.parse(lyricsResourceUrl),
    );
    final HttpClientResponse response = await request.close();

    if (response.statusCode != HttpStatus.ok) {
      throw Exception('Failed to load lyrics: ${response.statusCode}');
    }

    final String lyricsContent = await response.transform(utf8.decoder).join();
    httpClient.close();

    final assaDocument = _assaParser.parse(lyricsContent);

    return _convertAssaToLyricsDocument(assaDocument);
  }

  Future<LyricsDocumentEntity> _loadLyricsFromLocalFile(
    String absoluteFilePath,
  ) async {
    final file = File(absoluteFilePath);
    if (!await file.exists()) {
      throw FileSystemException('Lyrics file not found', absoluteFilePath);
    }

    final lyricsContent = await file.readAsString();
    final assaDocument = _assaParser.parse(lyricsContent);

    return _convertAssaToLyricsDocument(assaDocument);
  }

  bool _isRemoteUrl(String value) {
    return value.startsWith('http://') || value.startsWith('https://');
  }

  LyricsDocumentEntity _convertAssaToLyricsDocument(AssaDocument assaDocument) {
    final lines = assaDocument.lines.map((line) {
      return LyricsLineEntity(
        text: line.words.map((word) => word.text).join(' '),
        start: line.start,
        end: line.end,
        words: line.words.map((word) {
          return LyricsWordEntity(
            text: word.text,
            start: word.start,
            end: word.end,
          );
        }).toList(),
      );
    }).toList();

    return LyricsDocumentEntity(lines: lines);
  }

}