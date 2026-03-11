import 'dart:convert';
import 'dart:io';

import 'package:dhyana/model/lyrics_document.dart';
import 'package:dhyana/model/lyrics_line.dart';
import 'package:dhyana/model/lyrics_word.dart';
import 'package:dhyana/service/lyrics_service.dart';
import 'package:assa_parser/assa_parser.dart';

class DefaultLyricsService implements LyricsService {
  final AssaParser _assaParser = AssaParser();

  @override
  Future<LyricsDocument> loadLyrics(String lyricsResourceUrl) async {
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

  LyricsDocument _convertAssaToLyricsDocument(AssaDocument assaDocument) {
    final lines = assaDocument.lines.map((line) {
      return LyricsLine(
        text: line.words.map((word) => word.text).join(' '),
        start: line.start,
        end: line.end,
        words: line.words.map((word) {
          return LyricsWord(
            text: word.text,
            start: word.start,
            end: word.end,
          );
        }).toList(),
      );
    }).toList();

    return LyricsDocument(lines: lines);
  }


}
