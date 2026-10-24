// ignore_for_file: implementation_imports
import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:chanting/chanting.dart';
import 'package:chanting/src/domain/entity/chanting_state_entity.dart';
import 'package:chanting/src/domain/entity/lyrics_document_entity.dart';
import 'package:chanting/src/domain/entity/lyrics_line_entity.dart';
import 'package:chanting/src/domain/entity/lyrics_word_entity.dart';
import 'package:chanting/src/presentation/view/player/lyrics_effects_config.dart';
import 'package:chanting/src/presentation/view/player/lyrics_view.dart';
import 'package:chanting/src/presentation/viewmodel/chanting_cubit.dart';
import 'package:chanting/src/presentation/view/player/chanting_player_view.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mocktail/mocktail.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class _MockChantingCubit extends MockCubit<ChantingStateEntity>
    implements ChantingCubit {}

const _lineDuration = Duration(seconds: 3);
const _tick = Duration(milliseconds: 50);

const _lyricsText = [
  'jong gu op jin-on',
  'su-ri su-ri ma-ha-su-ri su-su-ri sa-ba-ha',
  'su-ri su-ri ma-ha-su-ri su-su-ri sa-ba-ha',
  'su-ri su-ri ma-ha-su-ri su-su-ri sa-ba-ha\n',
  'o bang nae woe an wi je shin gods jin-on',
  'na-mu sa-man-da mot-ta-nam om do-ro do-ro ji-mi sa-ba-ha',
  'na-mu sa-man-da mot-ta-nam om do-ro do-ro ji-mi sa-ba-ha',
  'na-mu sa-man-da mot-ta-nam om do-ro do-ro ji-mi sa-ba-ha\n',
  'gae gyong gye',
  'mu-sang shim-shim mi-myo bop',
  'baek-chon-man gop nan jo-u',
  'a gum mun gyon duk su ji'
];

/// Splits each text into evenly timed words, one line after another.
LyricsDocumentEntity _buildLyrics() {
  final lines = <LyricsLineEntity>[];
  for (var i = 0; i < _lyricsText.length; i++) {
    final text = _lyricsText[i];
    final lineStart = _lineDuration * i;
    final tokens = text.split(RegExp(r'(?<=\n)|[ ]+'));
    final wordDuration = _lineDuration ~/ tokens.length;
    lines.add(
      LyricsLineEntity(
        text: text,
        start: lineStart,
        end: lineStart + _lineDuration,
        words: [
          for (var w = 0; w < tokens.length; w++)
            LyricsWordEntity(
              text: tokens[w],
              start: lineStart + wordDuration * w,
              end: lineStart + wordDuration * (w + 1),
            ),
        ],
      ),
    );
  }
  return LyricsDocumentEntity(lines: lines);
}

final _lyrics = _buildLyrics();
final _totalDuration = _lineDuration * _lyricsText.length;

@widgetbook.UseCase(
  name: 'Simulated playback',
  type: LyricsView,
  path: '[Chanting]/internal/view/player/',
)
Widget buildLyricsView(BuildContext context) {
  final playing = context.knobs.boolean(label: 'Playing', initialValue: false);
  final topOffset = context.knobs.double.slider(
    label: 'Top offset',
    initialValue: 200,
    min: 0,
    max: 500,
  );

  final loaded = context.knobs.boolean(
    label: 'Lyrics loaded',
    initialValue: true,
  );

  return ColoredBox(
    // color: AppColors.backgroundPaper,
    color: Colors.black,
    child: _LyricsSimulation(
      playing: playing,
      topOffset: topOffset,
      loaded: loaded,
      effects: ChantingPlayerView.lyricsEffectsConfig,
    ),
  );
}

/// Advances a fake playback position and feeds it to [LyricsView]. A mocked
/// cubit routes the view's pause/seek calls back into the simulation.
class _LyricsSimulation extends StatefulWidget {
  final bool playing;
  final bool loaded;
  final double topOffset;
  final LyricsEffectsConfig effects;

  const _LyricsSimulation({
    required this.playing,
    required this.loaded,
    required this.topOffset,
    required this.effects,
  });

  @override
  State<_LyricsSimulation> createState() => _LyricsSimulationState();
}

class _LyricsSimulationState extends State<_LyricsSimulation> {
  late final _MockChantingCubit _cubit;
  late final Timer _timer;
  late bool _playing = widget.playing;
  Duration _position = Duration.zero;

  @override
  void initState() {
    super.initState();
    _cubit = _MockChantingCubit();
    whenListen(_cubit, const Stream<ChantingStateEntity>.empty(),
        initialState: _state);
    when(() => _cubit.pause()).thenAnswer((_) async {
      if (mounted) setState(() => _playing = false);
    });
    when(() => _cubit.seekToLine(any())).thenAnswer((invocation) async {
      final index = invocation.positionalArguments.first as int;
      if (!mounted || index < 0 || index >= _lyrics.lines.length) return;
      setState(() => _position = _lyrics.lines[index].start);
    });
    _timer = Timer.periodic(_tick, (_) {
      if (!_playing || !mounted) return;
      setState(() {
        _position += _tick;
        if (_position >= _totalDuration) _position = Duration.zero;
      });
    });
  }

  @override
  void didUpdateWidget(covariant _LyricsSimulation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.playing != oldWidget.playing) _playing = widget.playing;
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  ChantingStateEntity get _state {
    var activeIndex = 0;
    for (var i = 0; i < _lyrics.lines.length; i++) {
      if (_lyrics.lines[i].start <= _position) activeIndex = i;
    }
    return ChantingStateEntity(
      chantingSettings: const ChantingSettings(),
      playbackState: PlaybackState(
        playing: _playing,
        updatePosition: _position,
      ),
      lyricsLoadingState: widget.loaded
          ? ProcessingState.completed
          : ProcessingState.processing,
      lyricsDocument: widget.loaded ? _lyrics : null,
      activeLineIndex: activeIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChantingCubit>.value(
      value: _cubit,
      child: LayoutBuilder(
        builder: (context, constraints) => LyricsView(
          chantingState: _state,
          maxWidth: constraints.maxWidth,
          topOffset: widget.topOffset,
          effects: widget.effects,
        ),
      ),
    );
  }
}
