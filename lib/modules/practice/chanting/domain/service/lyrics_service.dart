import 'package:dhyana/modules/practice/chanting/domain/entity/lyrics_document.dart';

abstract interface class LyricsService {
  
  Future<LyricsDocument> loadLyrics(String lyricsResourceUrl);

}