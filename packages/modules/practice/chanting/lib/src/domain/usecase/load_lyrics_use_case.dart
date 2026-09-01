import 'package:core/core.dart';
import 'package:chanting/src/domain/entity/chanting_state_entity.dart';
import 'package:chanting/src/domain/entity/lyrics_document_entity.dart';
import 'package:chanting/src/domain/service/lyrics_service.dart';

class LoadLyricsUseCase with LoggerMixin {
  final LyricsService lyricsService;

  LoadLyricsUseCase({required this.lyricsService});

  Future<LyricsDocumentEntity> execute(String chantId, ChantingStateEntity state) async {
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