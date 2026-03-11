import 'package:dhyana/model/lyrics_document.dart';

abstract interface class LyricsService {
  
  Future<LyricsDocument> loadLyrics(String lyricsResourceUrl);

}