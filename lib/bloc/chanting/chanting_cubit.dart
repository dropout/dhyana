import 'dart:async';

import 'package:dhyana/enum/playback_state.dart';
import 'package:dhyana/model/chant.dart';
import 'package:dhyana/service/all.dart';
import 'package:dhyana/service/lyrics_service.dart';
import 'package:dhyana/util/logger_mixin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/model/chanting_settings.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttml_parser/ttml_parser.dart';

part 'chanting_state.dart';
part 'chanting_cubit.freezed.dart';

class ChantingCubit extends Cubit<ChantingState> with LoggerMixin {
  final ChantingSettings chantingSettings;
  final AudioService audioService;
  final LyricsService lyricsService;
  final ResourceResolver resourceResolver;
  final CrashlyticsService crashlyticsService;

  StreamSubscription? _positionSubscription;
  StreamSubscription? _playbackStateSubscription;

  ChantingCubit({
    required this.chantingSettings,
    required this.audioService,
    required this.lyricsService,
    required this.resourceResolver,
    required this.crashlyticsService,
  }) : super(ChantingState(chantingSettings: chantingSettings)) {
    _init();
  }

  Stream<Duration> get positionStream => audioService.positionStream.distinct();

  void _onPositionChanged(Duration position) {
    final activeLineIndex =
        state.lyricsDocument?.activeLineIndex(position) ?? 0;
    emit(state.copyWith(position: position, activeLineIndex: activeLineIndex));
  }

  void _onPlaybackStateChanged(PlaybackState playbackState) {
    emit(state.copyWith(playbackState: playbackState));
  }

  Future<void> _init() async {
    try {
      _positionSubscription = audioService.positionStream.distinct().listen(
        _onPositionChanged,
      );
      _playbackStateSubscription = audioService.playbackStateStream
          .distinct()
          .listen(_onPlaybackStateChanged);
      if (state.chantingSettings.selectedChants.isNotEmpty) {
        final firstChant = state.chantingSettings.selectedChants.first;
        await _loadChant(firstChant);
        play();
      }
    } catch (e, st) {
      emit(state.copyWith(playbackState: PlaybackState.error));
      crashlyticsService.recordError(
        exception: e,
        stackTrace: st,
        reason: 'Error initializing ChantingCubit',
      );
    }
  }

  Future<void> play() => audioService.play();
  Future<void> pause() => audioService.pause();
  Future<void> seek(Duration position) async {
    await audioService.seek(position);
    logger.t('Seek to position: ${position.inSeconds} seconds');
  }

  Future<void> release() => audioService.release();

  Future<void> prev() async {
    if (state.currentIndex > 0) {
      final newIndex = state.currentIndex - 1;
      final chant = state.chantingSettings.selectedChants[newIndex];
      await _loadChant(chant);
      emit(state.copyWith(currentIndex: newIndex));
    }
  }

  Future<void> next() async {
    if (state.currentIndex < state.chantingSettings.selectedChants.length - 1) {
      final newIndex = state.currentIndex + 1;
      final chant = state.chantingSettings.selectedChants[newIndex];
      await _loadChant(chant);
      emit(state.copyWith(currentIndex: newIndex));
    }
  }

  Future<void> _loadChant(Chant chant) async {
    try {
      emit(state.copyWith(playbackState: PlaybackState.loading));

      // load audio
      final url = await resourceResolver.getChantAudioUrl(chant.id);
      final duration = await audioService.loadFromUrl(url);

      // load lyrics
      final lyricsUrl = await resourceResolver.getChantLyricsUrl(chant.id);
      final lyricsDocument = await lyricsService.loadLyrics(lyricsUrl);

      emit(
        state.copyWith(
          duration: duration ?? Duration.zero,
          position: Duration.zero,
          lyricsDocument: lyricsDocument,
        ),
      );
    } catch (e, st) {
      emit(state.copyWith(playbackState: PlaybackState.error));
      crashlyticsService.recordError(
        exception: e,
        stackTrace: st,
        reason: 'Error loading chant ${chant.name}',
      );
    }
  }

  @override
  Future<void> close() {
    _positionSubscription?.cancel();
    _playbackStateSubscription?.cancel();
    audioService.release();
    return super.close();
  }
}
