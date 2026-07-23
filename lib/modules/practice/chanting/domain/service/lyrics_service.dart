import 'package:dhyana/modules/practice/chanting/domain/model/lyrics_document.dart';

abstract interface class LyricsService {
  
  Future<LyricsDocument> loadLyrics(String lyricsResourceUrl);

}