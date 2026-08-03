import 'package:dhyana/core/util/logger_mixin.dart';
import 'package:dhyana/modules/practice/chanting/domain/entity/chanting_state.dart';
import 'package:dhyana/modules/practice/chanting/domain/entity/lyrics_document.dart';
import 'package:dhyana/modules/practice/chanting/domain/service/lyrics_service.dart';

class LoadLyricsUseCase with LoggerMixin {
  final LyricsService lyricsService;

  LoadLyricsUseCase({required this.lyricsService});

  Future<LyricsDocument> execute(String chantId, ChantingState state) async {
    logger.t('Loading lyrics for chant ID: $chantId');
    // emit(state.copyWith(lyricsLoadingState: LoadingState.loading));
      final lyricsPath = state.chantResources
          .firstWhere((r) => r.id == chantId)
          .lyricsLocalPath;

      return await lyricsService.loadLyrics(lyricsPath);

      // User quickly pressed back button
      // if (isClosed) return;


      // emit(
      //   state.copyWith(
      //     lyricsLoadingState: LoadingState.loaded,
      //     lyricsDocument: lyricsDocument,
      //   ),
      // );
   }
 }