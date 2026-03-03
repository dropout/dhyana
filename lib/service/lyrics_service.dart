import 'package:ttml_parser/ttml_parser.dart';

abstract interface class LyricsService {
  
  Future<TtmlDocument> loadLyrics(String lyricsResourceUrl);

}