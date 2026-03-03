import 'dart:convert';
import 'dart:io';

import 'package:dhyana/service/lyrics_service.dart';
import 'package:ttml_parser/ttml_parser.dart';

class DefaultLyricsService implements LyricsService {

  final TtmlParser _ttmlParser = TtmlParser();
  
  @override
  Future<TtmlDocument> loadLyrics(String lyricsResourceUrl) async {
      final HttpClient httpClient = HttpClient();
      final HttpClientRequest request =
        await httpClient.getUrl(Uri.parse(lyricsResourceUrl));
      final HttpClientResponse response = await request.close();

      if (response.statusCode != HttpStatus.ok) {
        throw Exception('Failed to load lyrics: ${response.statusCode}');
      }

      final String lyricsContent = await response.transform(utf8.decoder).join();
      httpClient.close();

      return _ttmlParser.parse(lyricsContent);    
  }

}